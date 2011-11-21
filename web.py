import os

from flask import Flask,send_from_directory

app = Flask(__name__)
from bitslib.database import db

@app.route('/favicon.ico')
def favicon():
    """Reroute requests to the favicon to the correct location in static."""
    return send_from_directory(os.path.join(app.root_path, 'static'),
            'favicon.ico', mimetype='image/vnd.microsoft.icon')

@app.route('/')
def main():
    #Show main page with search
    return 'Hello World!'

@app.route('/search')
def search():
    pass

@app.route('/view/history')
def view_history():
    pass

@app.route('/view/order/jsjsakjsak')
def view_order():
    pass

@app.route('/view/cart')
def view_cart():
    pass

@app.route('/view/profile')
def view_profile():
    pass

@app.route('/edit/profile')
def edit_profile():
    pass

@app.route('/add/book/skjdnaskdsak')
def add_book_to_cart():
    pass

@app.route('/create/book')
def create_book():
    pass

@app.route('/view/inventory/jdjdsjdskjds')
def view_inventory():
    pass

@app.route('/view/inventory_order/jdjdsjdskjds')
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
