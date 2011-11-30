from flaskext.login import LoginManager
from bitslib.models import User

login_manager = LoginManager()
login_manager.login_view = "login"


@login_manager.user_loader
def load_user(user_id):
    try:
        ret = User.query.get(user_id)
        ret.authenticated = True
    except Exception as ex:
        print type(ex)
        print ex
        ret = None
    return ret
