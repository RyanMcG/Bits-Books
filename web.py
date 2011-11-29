import os

from bitslib.database import init_db
from bitslib.forms import LoginForm, RegistrationForm
from bitslib.models import User
from bitslib.user_manager import login_manager
from bitslib.utils import debug_str
from flask import (Flask, send_from_directory, render_template, redirect,
        request, url_for, flash)
from flaskext.login import (login_user, login_required, logout_user,
        current_user)
from sqlalchemy import and_
from sys import argv

#Create the app and then import the database (must be done in this order)
app = Flask(__name__)
db = init_db(app, argv)
login_manager.setup_app(app)


@app.route('/favicon.ico')
def favicon():
    """Reroute requests to the favicon to the correct location in static."""
    return send_from_directory(os.path.join(app.root_path, 'static'),
            'favicon.ico', mimetype='image/vnd.microsoft.icon')


@app.route('/')
def index():
    #Show main page with search
    return render_template("base.html")


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
                try:
                    user = User.query.filter(and_(
                        User.username == form.username.data,
                        User.password == form.password.data)).first()
                    user.authenticated = True
                    flash("Logged in successfully.", "success")
                    login_user(user, form.remember_me.data)
                    return redirect(to_page or url_for("index"))
                except:
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
    #TODO: Needs some work
    form = RegistrationForm()
    if form.validate_on_submit():
        try:
            db.session.add(User(form.email, form.username, form.password,
                form.name, form.phone))
            flash("Registration complete. Now try loggin in.")
            return redirect(request.args.get("next") or url_for("login"))
        except:
            flash("Invalid Username/Password")
    return render_template("login.html", form=form)


@app.route('/search')
def search():
    pass


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

if __name__ == '__main__':
    if app.is_production:
        address = "0.0.0.0"
        port = int(os.environ.get("PORT", 5000))
    else:
        app.debug = True
        address = "127.0.0.1"
        port = int(os.environ.get("PORT", 5000))

    app.run(address, port)
