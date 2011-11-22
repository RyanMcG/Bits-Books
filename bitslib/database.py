from web import app
from flaskext.sqlalchemy import SQLAlchemy
from os import path
from sys import argv
from yaml import load

#This application should be run in production mode if the first argument is
#"production"
app.is_production = len(argv) > 1 and argv[1].lower() == "production"


def _init_db(app):
    """Initialize a SQLALchemy instance for the given app."""
    dbshortname = 'production' if app.is_production else 'development'
    config_file = open(path.join(app.root_path, 'database.yml'))
    config = load(config_file)
    app.config['SQLALCHEMY_DATABASE_URI'] = config['databases'][\
            dbshortname]['hostspec']
    return SQLAlchemy(app)


db = _init_db(app)


class User(db.Model):
    pass
