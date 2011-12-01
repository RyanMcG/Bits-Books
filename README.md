# Bits & Books
### Authors: Ryan McGowan and Alex Notwell

## Description

Flask front-end for CSE 670 Database project.

## Development

### Technologies Used:

* Python
    * Flask
* Compass and SASS
    * blueprint/semantic
* HAML
* MySQL

--------
## Setup

### Database Setup

Setting up the database is a multi step process. To start off you need to have
the necessary permissions to create a database. Any value enclosed by angle
brackets (e.g. <variable>) is a variable and should be replaced by the
appropriate value.

If you are installing this on your own system and your MySQL super user is root
then you can use the following values:

    <super user> = root
    <bitbook user> = bitbook
    <bitbook database> = bitbook

If the database is preinstalled (e.g. if we are running this on stdsun), then
the first command should not be used.

1.  Create the database/schema and a user to access it. This only needs to be
    done if the database does not already exist.

        mysql -u <super user> -p < create-database.sql

2.  Create the tables (The default password for the bitbook user is 'amazon'). If
    you are not running as the bitbook user (e.g. the database has already been
    created for you) then use whatever username has already been given.

        mysql -u <bitbook user> -p <bitbook database> < create.sql

3.  To use the built in data loaders you must first have the python application
    setup properly.  This can be done by following the instructions below.

4.  After you have finished loading the data you may finalize the schema.

        mysql -u <bitbook user> -p <bitbook database> < finalize.sql

And that's it for creating the database. Once it is up and running you can try
installing and running the Flask application with the instructions below.

### Web Application (Python/Flask) Setup

This package is compatible with Heroku/cedar. See the Heroku website for
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

        pip install virtualenv

    You might need to run the above command as sudo depending on your setup.

3.  Setup and initialize *virtualenv*.

        cd /path/to/this/project/
        virtualenv --no-site-packages env
        source env/bin/activate

    If you are using bash you can replace the last command with: 

        . env/bin/activate

4.  Install Flask and other dependencies.

        pip install -r requirements.txt

5.  Before we can run the application we must make it aware of the database.
    Copy the `config-example.yml` file to `config.yml` with the following
    commands and edit it accordingly. *NOTE: Pay attention to what python to
    mysql adapter you use. You might not get pymysql to work on your machine,
    but something else might do the job.*

        cp config-example.yml config.yml
        $EDITOR config.yml

6.  That's it! You probably want to load the data now. You can do this by
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

        python web.py
 
    Or if you have foreman installed (`gem install foreman`):

        foreman start web
