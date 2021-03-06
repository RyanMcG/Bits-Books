#This file was modified after being generated by sqlautocode to work with
#Flask-SQLAlchemy

from datetime import datetime
from model.database import db
from functions.utils import str_to_digits, generate_encrypted_password

#Alias a function
now = datetime.now

#Setup helper tables

Book_Author = db.Table(u'Book_Author',
        db.Column(u'id', db.Integer(), primary_key=True, nullable=False),
        db.Column(u'book_id', db.Integer(), db.ForeignKey('Book.id')),
        db.Column(u'author_id', db.Integer(), db.ForeignKey('Author.id')),
        db.Column(u'date_created', db.DateTime(), nullable=False),
        db.Column(u'date_modified', db.DateTime(), nullable=False),
    )

Book_Category = db.Table(u'Book_Category',
        db.Column(u'id', db.Integer(), primary_key=True, nullable=False),
        db.Column(u'book_id', db.Integer(), db.ForeignKey('Book.id')),
        db.Column(u'category_id', db.Integer(), db.ForeignKey('Category.id')),
        db.Column(u'date_created', db.DateTime(), nullable=False),
        db.Column(u'date_modified', db.DateTime(), nullable=False),
    )


class Admin(db.Model):
    __tablename__ = 'Admin'

    __table_args__ = {}

    #column definitions
    date_created = db.Column(u'date_created', db.DateTime(), nullable=False)
    date_modified = db.Column(u'date_modified', db.DateTime(), nullable=False)
    id = db.Column(u'id', db.Integer(), primary_key=True, nullable=False)
    level = db.Column(u'level', db.String(length=8), nullable=False)
    user_id = db.Column(u'user_id', db.Integer(), db.ForeignKey('User.id'))

    def __init__(self, level, user_id):
        self.level = level
        self.user_id = user_id
        current_time = now().strftime("%Y-%m-%d %H:%M")
        self.date_created = current_time
        self.date_modified = current_time

    #db.relationship definitions
    User = db.relationship('User', primaryjoin='Admin.user_id==User.id',
            backref=db.backref('User', lazy='joined'))


class Author(db.Model):
    __tablename__ = 'Author'

    __table_args__ = {}

    #column definitions
    birth_date = db.Column(u'birth_date', db.Date())
    date_created = db.Column(u'date_created', db.DateTime(), nullable=False)
    date_modified = db.Column(u'date_modified', db.DateTime(), nullable=False)
    id = db.Column(u'id', db.Integer(), primary_key=True, nullable=False)
    name = db.Column(u'name', db.Text(), nullable=False)

    def __init__(self, name, b_date):
        current_time = now().strftime("%Y-%m-%d %H:%M")
        self.date_created = current_time
        self.date_modified = current_time
        self.name = name
        self.birth_date = b_date

    #db.relationship definitions
    Books = db.relationship('Book', secondary=Book_Author)


class Billing(db.Model):
    __tablename__ = 'Billing'

    __table_args__ = {}

    #column definitions
    date_created = db.Column(u'date_created', db.DateTime(), nullable=False)
    date_modified = db.Column(u'date_modified', db.DateTime(), nullable=False)
    id = db.Column(u'id', db.Integer(), primary_key=True, nullable=False)
    type = db.Column(u'type', db.String(length=12))
    user_id = db.Column(u'user_id', db.Integer(), db.ForeignKey('User.id'))

    def __init__(self, type, user_id):
        self.type = type
        self.user_id = user_id
        current_time = now().strftime("%Y-%m-%d %H:%M")
        self.date_created = current_time
        self.date_modified = current_time

    #db.relationship definitions
    User = db.relationship('User', primaryjoin='Billing.user_id==User.id')


class Book(db.Model):
    __tablename__ = 'Book'

    __table_args__ = {}

    #column definitions
    date_created = db.Column(u'date_created', db.DateTime(), nullable=False)
    date_modified = db.Column(u'date_modified', db.DateTime(), nullable=False)
    id = db.Column(u'id', db.Integer(), primary_key=True, nullable=False)
    isbn = db.Column(u'isbn', db.BigInteger(), nullable=False, unique=True)
    price = db.Column(u'price', db.DECIMAL(precision=7, scale=2),
            nullable=False)
    publisher_id = db.Column(u'publisher_id', db.Integer(),
            db.ForeignKey('Publisher.id'))
    title = db.Column(u'title', db.Text(), nullable=False)

    def __init__(self, isbn, title, price, pub_id):
        current_time = now().strftime("%Y-%m-%d %H:%M")
        self.date_created = current_time
        self.date_modified = current_time
        self.isbn = isbn
        self.title = title
        self.price = price
        self.publisher_id = pub_id

    def __repr__(self):
        return "<Book id: {0}, title: {1}>".format(self.id, self.title)

    #db.relationship definitions
    Publisher = db.relationship('Publisher',
            primaryjoin='Book.publisher_id==Publisher.id')
    Authors = db.relationship('Author', secondary=Book_Author,
            backref=db.backref('books'))
    Categories = db.relationship('Category', secondary=Book_Category,
            backref=db.backref('books'))


class Cart(db.Model):
    __tablename__ = 'Cart'

    __table_args__ = {}

    #column definitions
    date_created = db.Column(u'date_created', db.DateTime(), nullable=False)
    date_modified = db.Column(u'date_modified', db.DateTime(), nullable=False)
    id = db.Column(u'id', db.Integer(), primary_key=True, nullable=False)
    user_id = db.Column(u'user_id', db.Integer(), db.ForeignKey('User.id'))
    status = db.Column(u'status', db.String(length=10), nullable=False)

    def __init__(self, user_id, status):
        self.user_id = user_id
        self.status = status
        current_time = now().strftime("%Y-%m-%d %H:%M")
        self.date_created = current_time
        self.date_modified = current_time


class CartItem(db.Model):
    __tablename__ = 'CartItem'

    __table_args__ = {}

    id = db.Column(u'id', db.Integer(), primary_key=True, nullable=False)
    cart_id = db.Column(u'cart_id', db.Integer(), db.ForeignKey('Cart.id'))
    book_id = db.Column(u'book_id', db.Integer(), db.ForeignKey('Book.id'))
    quantity = db.Column(u'quantity', db.Integer())
    status = db.Column(u'status', db.String(length=10), nullable=False)
    date_created = db.Column(u'date_created', db.DateTime(), nullable=False)
    date_modified = db.Column(u'date_modified', db.DateTime(), nullable=False)

    def __init__(self, cart_id, book_id, quantity, status):
        self.cart_id = cart_id
        self.book_id = book_id
        self.quantity = quantity
        self.status = status
        current_time = now().strftime("%Y-%m-%d %H:%M")
        self.date_created = current_time
        self.date_modified = current_time

    #db.relationship definitions
    Book = db.relationship('Book', primaryjoin='CartItem.book_id==Book.id')
    Cart = db.relationship('Cart', primaryjoin='CartItem.cart_id==Cart.id')


class Category(db.Model):
    __tablename__ = 'Category'

    __table_args__ = {}

    #column definitions
    date_created = db.Column(u'date_created', db.DateTime(), nullable=False)
    date_modified = db.Column(u'date_modified', db.DateTime(), nullable=False)
    id = db.Column(u'id', db.Integer(), primary_key=True, nullable=False)
    name = db.Column(u'name', db.String(length=64), nullable=False,
            unique=True)

    def __init__(self, name):
        self.name = name
        current_time = now().strftime("%Y-%m-%d %H:%M")
        self.date_created = current_time
        self.date_modified = current_time

    #db.relationship definitions
    Books = db.relationship('Book', secondary=Book_Category)


class Creditcard(db.Model):
    __tablename__ = 'Creditcard'

    id = db.Column(u'id', db.Integer(), primary_key=True, nullable=False)
    address_id = db.Column(u'address_id', db.Integer(),
            db.ForeignKey('UserAddress.id'))
    billing_id = db.Column(u'billing_id', db.Integer(),
            db.ForeignKey('Billing.id'))
    name = db.Column(u'name', db.String(length=64), nullable=False)
    cc_number = db.Column(u'cc_number', db.BigInteger(), nullable=False)
    sec_number = db.Column(u'sec_number', db.Integer(), nullable=False)
    exp_date = db.Column(u'exp_date', db.Date(), nullable=False)
    date_created = db.Column(u'date_created', db.DateTime(), nullable=False)
    date_modified = db.Column(u'date_modified', db.DateTime(), nullable=False)

    def __init__(self, name, address_id, billing_id, cc_number, sec_number,
            exp_date):
        self.address_id = address_id
        self.billing_id = billing_id
        self.name = name
        self.cc_number = cc_number
        self.sec_number = sec_number
        self.exp_date = exp_date
        current_time = now().strftime("%Y-%m-%d %H:%M")
        self.date_created = current_time
        self.date_modified = current_time

    #db.relationship definitions
    UserAddress = db.relationship('UserAddress',
            primaryjoin='Creditcard.address_id==UserAddress.id')
    Billing = db.relationship('Billing',
            primaryjoin='Creditcard.billing_id==Billing.id')


class Giftcard(db.Model):
    __tablename__ = 'Giftcard'

    __table_args__ = {}

    #column definitions
    billing_id = db.Column(u'billing_id', db.Integer(),
            db.ForeignKey('Billing.id'))
    date_created = db.Column(u'date_created', db.DateTime(), nullable=False)
    date_modified = db.Column(u'date_modified', db.DateTime(), nullable=False)
    id = db.Column(u'id', db.Integer(), primary_key=True, nullable=False)
    number = db.Column(u'number', db.String(length=24), nullable=False,
            unique=True)
    pin = db.Column(u'pin', db.Integer(), nullable=False)

    def __init__(self, billing_id, number, pin):
        self.billing_id = billing_id
        self.number = number
        self.pin = pin
        current_time = now().strftime("%Y-%m-%d %H:%M")
        self.date_created = current_time
        self.date_modified = current_time

    #db.relationship definitions
    Billing = db.relationship('Billing',
            primaryjoin='Giftcard.billing_id==Billing.id')


class Inventory(db.Model):
    __tablename__ = 'Inventory'

    __table_args__ = {}

    #column definitions
    book_id = db.Column(u'book_id', db.Integer(), db.ForeignKey('Book.id'))
    date_created = db.Column(u'date_created', db.DateTime(), nullable=False)
    date_modified = db.Column(u'date_modified', db.DateTime(), nullable=False)
    id = db.Column(u'id', db.Integer(), primary_key=True, nullable=False)
    quantity = db.Column(u'quantity', db.Integer(), nullable=False)
    status = db.Column(u'status', db.String(length=10), nullable=False)

    def __init__(self, book_id, quantity, status):
        self.book_id = book_id
        self.quantity = quantity
        self.status = status
        current_time = now().strftime("%Y-%m-%d %H:%M")
        self.date_created = current_time
        self.date_modified = current_time

    #db.relationship definitions
    Book = db.relationship('Book', primaryjoin='Inventory.book_id==Book.id')


class InventoryOrder(db.Model):
    __tablename__ = 'InventoryOrder'

    __table_args__ = {}

    #column definitions
    cost = db.Column(u'cost', db.DECIMAL(precision=7, scale=2), nullable=False)
    cur_quantity = db.Column(u'cur_quantity', db.Integer(), nullable=False)
    date_created = db.Column(u'date_created', db.DateTime(), nullable=False)
    date_modified = db.Column(u'date_modified', db.DateTime(), nullable=False)
    id = db.Column(u'id', db.Integer(), primary_key=True, nullable=False)
    inventory_id = db.Column(u'inventory_id', db.Integer(),
            db.ForeignKey('Inventory.id'))
    orig_quantity = db.Column(u'orig_quantity', db.Integer(), nullable=False)

    def __init__(self, cost, cur_quantity, inv_id, orig_quant):
        self.cost = cost
        self.cur_quantity = cur_quantity
        self.inventory_id = inv_id
        self.orig_quantity = orig_quant
        current_time = now().strftime("%Y-%m-%d %H:%M")
        self.date_created = current_time
        self.date_modified = current_time

    #db.relationship definitions
    Inventory = db.relationship('Inventory',
            primaryjoin='InventoryOrder.inventory_id==Inventory.id')


class Order(db.Model):
    __tablename__ = 'Order'

    id = db.Column(u'id', db.Integer(), primary_key=True, nullable=False)
    user_id = db.Column(u'user_id', db.Integer(), db.ForeignKey('User.id'))
    cart_id = db.Column(u'cart_id', db.Integer(), db.ForeignKey('Cart.id'))
    shipping = db.Column(u'shipping', db.DECIMAL(precision=7, scale=2),
            nullable=False)
    tax = db.Column(u'tax', db.DECIMAL(precision=7, scale=2), nullable=False)
    status = db.Column(u'status', db.String(length=10), nullable=False)
    date_created = db.Column(u'date_created', db.DateTime(), nullable=False)
    date_modified = db.Column(u'date_modified', db.DateTime(), nullable=False)

    def __init__(self, user_id, cart_id, shipping, tax, status):
        self.user_id = user_id
        self.cart_id = cart_id
        self.shipping = shipping
        self.tax = tax
        self.subtotal = 0
        self.status = status
        current_time = now().strftime("%Y-%m-%d %H:%M")
        self.date_created = current_time
        self.date_modified = current_time

    #db.relationship definitions
    User = db.relationship('User', primaryjoin='Order.user_id==User.id')
    Cart = db.relationship('Cart', primaryjoin='Order.cart_id==Cart.id')


class OrderItem(db.Model):
    __tablename__ = 'OrderItem'

    id = db.Column(u'id', db.Integer(), primary_key=True, nullable=False)
    order_id = db.Column(u'order_id', db.Integer(), db.ForeignKey('Order.id'))
    book_id = db.Column(u'book_id', db.Integer(), db.ForeignKey('Book.id'))
    quantity = db.Column(u'quantity', db.Integer())
    cost = db.Column(u'cost', db.DECIMAL(precision=7, scale=2), nullable=False)
    price = db.Column(u'price', db.DECIMAL(precision=7, scale=2),
            nullable=False)
    status = db.Column(u'status', db.String(length=10), nullable=False)
    date_created = db.Column(u'date_created', db.DateTime(), nullable=False)
    date_modified = db.Column(u'date_modified', db.DateTime(), nullable=False)

    def __init__(self, order_id, book_id, quantity, cost, price, status):
        self.order_id = order_id
        self.book_id = book_id
        self.quantity = quantity
        self.cost = cost
        self.price = price
        self.status = status
        current_time = now().strftime("%Y-%m-%d %H:%M")
        self.date_created = current_time
        self.date_modified = current_time

    #db.relationship definitions
    Order = db.relationship('Order',
            primaryjoin='OrderItem.order_id==Order.id')
    Book = db.relationship('Book', primaryjoin='OrderItem.book_id==Book.id')


class OrderPayment(db.Model):
    __tablename__ = 'OrderPayment'

    id = db.Column(u'id', db.Integer(), primary_key=True, nullable=False)
    order_id = db.Column(u'order_id', db.Integer(), db.ForeignKey('Order.id'))
    billing_id = db.Column(u'billing_id', db.Integer(),
            db.ForeignKey('Billing.id'))
    price = db.Column(u'price', db.DECIMAL(precision=7, scale=2),
            nullable=False)
    date_created = db.Column(u'date_created', db.DateTime(), nullable=False)
    date_modified = db.Column(u'date_modified', db.DateTime(), nullable=False)

    def __init__(self, order_id, billing_id, price):
        self.order_id = order_id
        self.billing_id = billing_id
        self.price = price
        current_time = now().strftime("%Y-%m-%d %H:%M")
        self.date_created = current_time
        self.date_modified = current_time

    #db.relationship definitions
    Order = db.relationship('Order',
            primaryjoin='OrderPayment.order_id==Order.id')
    Billing = db.relationship('Billing',
            primaryjoin='OrderPayment.billing_id==Billing.id')


class Publisher(db.Model):
    __tablename__ = 'Publisher'

    __table_args__ = {}

    #column definitions
    city = db.Column(u'city', db.String(length=20))
    country = db.Column(u'country', db.String(length=20))
    date_created = db.Column(u'date_created', db.DateTime(), nullable=False)
    date_modified = db.Column(u'date_modified', db.DateTime(), nullable=False)
    established_date = db.Column(u'established_date', db.Date())
    id = db.Column(u'id', db.Integer(), primary_key=True, nullable=False)
    name = db.Column(u'name', db.String(length=32), nullable=False)
    state = db.Column(u'state', db.String(length=20))

    def __init__(self, name, city, state, country, est_date):
        self.name = name
        self.city = city
        self.state = state
        self.country = country
        self.established_date = est_date
        current_time = now().strftime("%Y-%m-%d %H:%M")
        self.date_created = current_time
        self.date_modified = current_time


class User(db.Model):
    __tablename__ = 'User'

    __table_args__ = {}

    #column definitions
    date_created = db.Column(u'date_created', db.DateTime(), nullable=False)
    date_modified = db.Column(u'date_modified', db.DateTime(), nullable=False)
    email = db.Column(u'email', db.String(length=128), nullable=False,
            unique=True)
    id = db.Column(u'id', db.Integer(), primary_key=True, nullable=False)
    name = db.Column(u'name', db.String(length=64))
    password = db.Column(u'password', db.String(length=64), nullable=False)
    phone = db.Column(u'phone', db.BigInteger())
    username = db.Column(u'username', db.String(length=32), nullable=False,
            unique=True)
    authenticated = False

    def __init__(self, email, username, password, name=None, phone=None):
        self.name = name if name != '' else None
        self.username = username
        self.email = email
        self.password = generate_encrypted_password(password)
        self.phone = str_to_digits(phone)
        current_time = now().strftime("%Y-%m-%d %H:%M")
        self.date_created = current_time
        self.date_modified = current_time
        self.authenticated = False

    def __repr__(self):
        return "<User id: {id}, username: {usn}, name: {name},>".format(
                id=self.id, name=self.name, usn=self.username,
                auth=self.authenticated)

        #Methods for Flask-Login

    def get_id(self):
        return unicode(self.id)

    def is_anonymous(self):
        return not isinstance(self.id, long)

    def is_authenticated(self):
        return self.authenticated

    def is_active(self):
        return self.is_authenticated()

    def is_admin(self):
        #TODO: Test whehter admin relationship exists
        return False

    #db.relationship definitions
    Carts = db.relationship('Cart', primaryjoin='User.id==Cart.user_id',
            backref=db.backref('User'))


class UserAddress(db.Model):
    __tablename__ = 'UserAddress'

    __table_args__ = {}

    #column definitions
    address1 = db.Column(u'address1', db.String(length=64), nullable=False)
    address2 = db.Column(u'address2', db.String(length=32))
    city = db.Column(u'city', db.String(length=32), nullable=False)
    country = db.Column(u'country', db.String(length=32), nullable=False)
    date_created = db.Column(u'date_created', db.DateTime(), nullable=False)
    date_modified = db.Column(u'date_modified', db.DateTime(), nullable=False)
    id = db.Column(u'id', db.Integer(), primary_key=True, nullable=False)
    name = db.Column(u'name', db.String(length=64), nullable=False)
    state = db.Column(u'state', db.String(length=20))
    status = db.Column(u'status', db.String(length=10), nullable=False)
    user_id = db.Column(u'user_id', db.Integer(), db.ForeignKey('User.id'))
    zip = db.Column(u'zip', db.Integer())

    def __init__(self, user_id, name, adr1, adr2, city, state, zip, country):
        self.user_id = user_id
        self.name = name
        self.address1 = adr1
        self.address2 = adr2
        self.city = city
        self.state = state
        self.zip = zip
        self.country = country
        self.status = 'OK'
        current_time = now().strftime("%Y-%m-%d %H:%M")
        self.date_created = current_time
        self.date_modified = current_time

    #db.relationship definitions
    User = db.relationship('User', primaryjoin='UserAddress.user_id==User.id',
            backref=db.backref('UserAddress'))
