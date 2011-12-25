from flaskext.sqlalchemy import SQLAlchemy

#This application should be run in production mode if the first argument is
#"production"

db = SQLAlchemy()


def init_db(app, cliargs):
    """Initialize a SQLALchemy instance for the given app."""
    db.app = app
    db.init_app(app)
    return db
