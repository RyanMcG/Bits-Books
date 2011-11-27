from flaskext.sqlalchemy import SQLAlchemy
from os import path
from yaml import load

#This application should be run in production mode if the first argument is
#"production"


def init_db(app, cliargs):
    """Initialize a SQLALchemy instance for the given app."""
    app.is_production = len(cliargs) > 1 and cliargs[1].lower() == "production"
    dbshortname = 'production' if app.is_production else 'development'
    config_file = open(path.join(app.root_path, 'database.yml'))
    config = load(config_file)
    app.config['SQLALCHEMY_DATABASE_URI'] = config['databases'][\
            dbshortname]['hostspec']
    return SQLAlchemy(app)
