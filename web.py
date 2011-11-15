import os
from flask import Flask, send_from_directory
app = Flask(__name__)

@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
            'favicon.ico', mimetype='image/vnd.microsoft.icon')

@app.route('/')
def main():
    #Show main page with search
    return 'Hello World!'

@app.route('/search')
def search():
    pass

@app.route('/user/view/history')
def add_book_to_cart():
    pass

@app.route('/user/view/order/jsjsakjsak')
def add_book_to_cart():
    pass

@app.route('/user/view/cart')
def add_book_to_cart():
    pass

@app.route('/user/view/profile')
def add_book_to_cart():
    pass

@app.route('/user/edit/profile')
def add_book_to_cart():
    pass

@app.route('/user/add/book/skjdnaskdsak')
def add_book_to_cart():
    pass

@app.route('/admin/create/book')
def create_book():
    pass

@app.route('/admin/view/inventory/jdjdsjdskjds')
def create_book():
    pass

@app.route('/admin/view/inventory_order/jdjdsjdskjds')
def create_book():
    pass

@app.route('/admin/view/')
def create_book():
    pass

@app.route('/admin/create/inventory_order')
def create_book():
    pass

if __name__ == '__main__':
    #Change this to false when on production
    port = int(os.environ.get("PORT", 5000))
    app.debug = True
    app.run("0.0.0.0", port)
