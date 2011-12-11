# Bits & Books
### Authors: Ryan McGowan and Alex Notwell

## Description

Flask front-end for sample book selling ecommerce site called Bits &amp; Books.

## Development

### Technologies Used:

* Python
    * Flask
* Compass and SASS
    * blueprint/semantic
* HAML
* PostgreSQL (or another RDBMS that SQLAlchemy supports)

--------
## Setup

### Database Setup

Setting up the database is pretty simple process. Creating the tables and
loading the data can be done from within python. You must setup a database first
though.

Create the database/schema and a user to access it. This only needs to be
done if the database does not already exist. You might need to customize the
`create-database.sql` file to use the correct database and username for your
setup. Really, the given file is really just a sample.

    psql -U <super user> < create-database.sql

By default the super user is `postgres`.

### Web Application (Python/Flask) Setup

Once the database is setup we need to properly isntall the application, create
some tables and finally load some sample data.

This application is compatible with Heroku/cedar. See the Heroku website for
[instructions on how to deploy a Python - Flask app to
Heroku](http://devcenter.heroku.com/articles/python).

To get the app running locally you just need to run a few commands. (Most of
these are covered in the Heroku instructions referenced above).

1.  Install *pip* on your computer (if it isn't already installed). This may change
    depending on your distribution, so you might want to look this up on your
    own.

    Since Flask is not compatible with Python 3 you should make sure that your
    *pip* excutable is using Python 2.x not Python 3.x. On [Arch
    Linux](http://www.archlinux.org) this means you have to run 'pip-2.7' instead
    of 'pip'.

2.  Install *virtualenv*

        $ pip install virtualenv

    You might need to run the above command as sudo depending on your setup.

3.  Setup and initialize *virtualenv*.

        $ cd /path/to/this/project/
        $ virtualenv --no-site-packages env
        $ source env/bin/activate

    If you are using bash you can replace the last command with: 

        $ . env/bin/activate

4.  Install Flask and other dependencies.

        $ pip install -r requirements.txt

5.  Before we can run the application we must make it aware of the database.
    Copy the `config-example.yml` file to `config.yml` with the following
    commands and edit it accordingly. *NOTE: Pay attention to what python
    database adapter you use. You might have better luck using different ones on
    your system*

        $ cp config-example.yml config.yml
        $ $EDITOR config.yml

6.  Now that we have configured a connection to the database we can create our
    tables. To do this you start an interactive python prompt and import the
    `play.py` file.

        $ python
        ...
        >>> from play import *

    Then we just have to run `create_all` on the database session to create the
    tables.

        >>> db.create_all()

7.  That's it! You probably want to load the data now. You can do this by
    running the following commands: 

        $ python load-users.py
        $ python load-books.py
        $ python load-inventory-orders.py

    Once that's done you can now either use the application interactively:

        $ python
        ....
        >>> from play import *
        >>> #Now I can use the models and application to do whatever I want
        >>> User.query.all() # This returns all the users in the database

    Or you can start the web app:

        $ python web.py
 
    Or if you have foreman installed (`gem install foreman`):

        $ foreman start web
