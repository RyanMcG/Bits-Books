from flaskext.wtf import (Form, TextField, PasswordField, BooleanField,
        validators)
from flaskext.wtf.html5 import EmailField


class LoginForm(Form):
    username = TextField('Username', [
        validators.Required(),
        validators.Length(min=4, max=32)])
    password = PasswordField('Password', [
        validators.Required(),
        ])
    remember_me = BooleanField('Remember me?')


class RegistrationForm(LoginForm):
    email = EmailField('Email Address', [
        validators.Required(),
        validators.Length(min=6, max=64),
        validators.Email(u'Invalid Email Address')
    ])
    name = TextField('Full Name (Optional)', [
        validators.Optional(),
        validators.Length(min=2, max=64)])
    phone = TextField('Phone Number', [
        validators.Optional(),
        validators.Length(min=5, max=20)])
    password = PasswordField('New Password', [
        validators.Required(),
        validators.EqualTo('confirm', message='Passwords must match')
        ])
    confirm = PasswordField('Repeat Password')
    admin = BooleanField('Make me an Admin')


class SearchForm(Form):
    search = TextField('Search', [validators.Required()])
