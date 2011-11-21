from flask import Flask
from yaml import load

app = Flask(__name__)
app.is_production = os.getenv("BITS_BOOKS_SERVER_TYPE") == "production"

def _init_db(app):
    dbshortname = 'production' if app.is_production else 'development'
    config_file = open('/'.join([app.root_path, 'database.yml']))
    config = load(config_file)
    app.config['SQLALCHEMY_DATABASE_URI'] = config['databases'][dbshortname]['hostspec'];
    return SQLAlchemy(app)

db = _init_db(app)

class User(db.Model):
    pass
