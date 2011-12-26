import hashlib
from flaskext.login import LoginManager
from model.models import User

login_manager = LoginManager()
login_manager.login_view = "login"


@login_manager.user_loader
def load_user(user_id):
    """Used by Flask-Login to get a user by its id."""
    try:
        ret = User.query.get(user_id)
        ret.authenticated = True
    except Exception as ex:
        print type(ex)
        print ex
        ret = None
    return ret


def check_login(username, password):
    """Checks whether or not the given username and password are valid."""
    user = User.query.filter(User.username ==
            username).first()
    if user:
        hasher = hashlib.sha1()
        salt, pwd = user.password.split('$', 2)
        hasher.update(salt + password)
        if hasher.hexdigest() == pwd:
            user.authenticated = True
            return user
        else:
            return False
    else:
        return False
