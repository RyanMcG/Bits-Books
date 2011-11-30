from flaskext.sqlalchemy import SQLAlchemy

from os import path
from yaml import load

#This application should be run in production mode if the first argument is
#"production"

db = SQLAlchemy()


def init_app(app, cliargs):
    """Initialize a SQLALchemy instance for the given app."""
    app.is_production = len(cliargs) > 1 and cliargs[1].lower() == "production"
    dbshortname = 'production' if app.is_production else 'development'
    app.debug = not app.is_production
    config_file = open(path.join(app.root_path, 'config.yml'))
    config = load(config_file)
    app.config['SQLALCHEMY_DATABASE_URI'] = config['databases'][\
            dbshortname]['hostspec']
    app.config['SQLALCHEMY_RECORD_QUERIES'] = app.debug
    app.config['SQLALCHEMY_ECHO'] = app.debug
    app.secret_key = config['application']['secret_key']
    db.app = app
    db.init_app(app)
    return db
