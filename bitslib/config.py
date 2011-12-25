from os import path, environ
from yaml import load


def read_system_config(app, cliargs):
    server_type = "development"  # The default server type

    # If we were pased in a cli argument parst it as the server_type
    if len(cliargs) > 1:
        server_type = cliargs[1].lower()
    elif "BITS_BOOKS_SERVER_TYPE" in environ:
        #Check to see if an environment variable specifies server_type
        server_type = environ.get("BITS_BOOKS_SERVER_TYPE")

    app.is_production = server_type == "production"

    print "Running as production . . ." if app.is_production else \
            "Running in dev mode . . ."

    #Based on the server_type set up some other variables.
    app.debug = not app.is_production

    app.config['SQLALCHEMY_RECORD_QUERIES'] = app.debug
    app.config['SQLALCHEMY_ECHO'] = app.debug
    try:
        config_file = open(path.join(app.root_path, 'config.yml'))
        config = load(config_file)
        app.config['SQLALCHEMY_DATABASE_URI'] = config['databases'][\
                server_type]['hostspec']
        app.secret_key = config['application']['secret_key']
    except IOError:
        # There is no config.yml file so check to see if we can use environment
        # variables.
        if "DATABASE_URL" in environ:
            app.config['SQLALCHEMY_DATABASE_URI'] = environ.get("DATABASE_URL")
        else:
            #TODO: Change this to a simple write to log
            raise RuntimeWarning("Could not determine database uri.\
                    Application will surely fail.")
        if "BITS_BOOKS_SECRET_KEY" in environ:
            app.secret_key = environ.get("BITS_BOOKS_SECRET_KEY")
        else:
            raise RuntimeWarning("Could not set the secret key. (No \
                    configuration.")
