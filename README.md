# Bits & Books
### Authors: Ryan McGowan and Alex Notwell

## Description

Flask front-end for CSE 670 Database project.

## Development

### Technologies Used:

* Python - Flask
* Compass and SASS
  * blueprint/semantic
* HAML
* MySQL

## Setup

### Database Setup

Setting up the database is a three step process.

1. Create the schema and tables. To do this run:

    mysql create.sql

2. Load some data with the following command:

    mysql load_data.sql

3. Finish up by installing foreign keys and triggers.

    mysql finialize.sql

And that's it for creating the database. Once it is up and running you can try
installing and running the Flask application with the instructions below.

### Web Application (Python/Flask) Setup
