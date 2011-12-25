import os

from bitslib.database import init_app
from bitslib.forms import LoginForm, RegistrationForm, SearchForm
from bitslib.models import User, Book, Author
from bitslib.user_manager import login_manager, check_login
from bitslib.utils import debug_str, str_to_digits
from flask import (Flask, send_from_directory, render_template, redirect,
        request, url_for, flash)
from flaskext.login import (login_user, login_required, logout_user,
        current_user)
from sys import argv

#Create the app and then import the database (must be done in this order)
app = Flask(__name__)
db = init_app(app, argv)
login_manager.setup_app(app)


@app.context_processor
def inject_user():
    """Tell the view whether someone is logged in or not"""
    return {'logged_in': current_user.is_active(),
            'is_admin': current_user.is_active() and current_user.is_admin()}


@app.route('/favicon.ico')
def favicon():
    """Reroute requests to the favicon to the correct location in static."""
    return send_from_directory(os.path.join(app.root_path, 'static'),
            'favicon.ico', mimetype='image/vnd.microsoft.icon')


@app.route('/')
def index():
    #Show main page with search
    form = SearchForm()
    results = False
    search = request.args.get("search")
    if search:
        searchq = "%" + search + "%"
        books = Book.query.filter(Book.title.like(searchq)).all()
        authors = Author.query.filter(Author.name.like(searchq)).all()
        for a in authors:
            books.extend(a.Books)
        results = [(x.isbn, x.title, x.price) for x in books]
    return render_template("index.html", form=form, results=results)


@app.route("/logout")
@login_required
def logout():
    logout_user()
    return redirect(request.args.get("next") or url_for("index"))


@app.route('/login', methods=["GET", "POST"])
def login():
    if not current_user.is_active():
        to_page = request.args.get("next")
        if to_page == url_for("logout"):
            to_page = False
        form = LoginForm()
        if form.is_submitted():
            if form.validate():
                user = check_login(form.username.data, form.password.data)
                if user:
                    login_user(user, form.remember_me.data)
                    flash("Logged in successfully.", "success")
                    return redirect(to_page or url_for("index"))
                else:
                    flash("Invalid Username/Password", "error")
            else:
                for key, msg in form.errors.items():
                    flash("Could not validate " + key + ": " + ", ".join(msg),
                            "error")
        return render_template("login.html", form=form)
    else:
        flash("You are already logged in!", "info")
        return redirect(request.args.get("next") or url_for("index"))


@app.route('/register', methods=["GET", "POST"])
def register():
    if not current_user.is_active():
        to_page = request.args.get("next")
        if to_page == url_for("logout"):
            to_page = False
        form = RegistrationForm()
        if form.is_submitted():
            if form.validate():
                try:
                    db.session.add(User(form.email.data,
                        form.username.data, form.password.data, form.name.data,
                        str_to_digits(form.phone.data)))
                    db.session.commit()
                    flash("Congratualtions, " + (form.name.data or
                        form.username.data) + "! You have registered\
                                successfully!", "success")
                    return redirect(to_page or url_for("index"))
                except:
                    if not app.debug:
                        flash("We're sorry, we were unable to register you.\
                                Feel free to try again.", "error")
                    else:
                        raise
            else:
                for key, msg in form.errors.items():
                    flash("Could not validate " + key + ": " + ", ".join(msg),
                            "error")
        return render_template("register.html", form=form)
    else:
        flash("You are already logged in!", "info")
        return redirect(request.args.get("next") or url_for("index"))


@app.route('/view/history')
def view_history():
    pass


@app.route('/view/order/<int:order_id>')
def view_order():
    pass


@app.route('/view/cart')
def view_cart():
    pass


@app.route('/view/profile')
@app.route('/view/profile/<int:user_id>')
def edit_profile():
    users = User.get().all()
    return debug_str(users)


@app.route('/add/book/<int:book_id>')
def add_book_to_cart():
    pass


@app.route('/create/book')
def create_book():
    pass


@app.route('/view/inventory/<int:inventory_id>')
def view_inventory():
    pass


@app.route('/view/inventory_order/<int:inventory_order_id>')
def view_inventory_order():
    pass


@app.route('/create/inventory_order')
def create_inventory_order():
    pass


def run_application():
    if app.is_production:
        address = "0.0.0.0"
        port = int(os.environ.get("PORT", 5000))
    else:
        address = "127.0.0.1"
        port = int(os.environ.get("PORT", 5000))

    app.run(address, port)


if __name__ == '__main__':
    run_application()
