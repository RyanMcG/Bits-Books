# Bits & Books - User Manual
### Authors: Ryan McGowan and Alex Notwell

## Introduction

This document contains the source code used to generate our database schema as
well as some example queries. Attached is a fully normalized relational schema
of our database.

## Creating the database

The database creation process can be spilt up into three steps:

1.  Creation of the schema. A skeleton to hold our data.

2.  Loading of data.

3.  Finalize by adding key constraints.

### Part 1. Schema Creation

If a database and user do not already exist, we must create them. That is what
`create-database.sql` is for.

#### create-database.sql

    -- Create Database and User

    -- This file does not need to be run on the CSE servers, but otherwise can be
    -- used to setup a development/testing database and a User to manipulate it.

    -- The following commands must be executed by a User who has the required
    -- privileges.

    CREATE SCHEMA bitbook;
    CREATE USER 'bitbook'@'localhost' IDENTIFIED BY 'amazon';
    GRANT ALL ON bitbook.* TO 'bitbook'@'localhost';
    USE bitbook;
    -- Authors:	Ryan McGowan
    --		Alex Notwell
    -- First we create the database

    -- CREATE DATABASE bitsbooks;
    -- Set our default storage engine
    SET storage_engine=INNODB;

Once we have access to the database we use `create.sql` to generate our tables.

#### create.sql

    -- Step 1: Table Creation
    -- Book
    CREATE TABLE Book (
      id INT(13) NOT NULL AUTO_INCREMENT,
      isbn INT(13) UNIQUE NOT NULL,
      title VARCHAR(64) NOT NULL,
      publisher_id INT(13),
      price DECIMAL(7,2) NOT NULL,
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id),
      UNIQUE (isbn)
    );

    -- Publisher
    CREATE TABLE Publisher (
      id INT(13) NOT NULL AUTO_INCREMENT,
      name VARCHAR(32) NOT NULL,
      city VARCHAR(20),
      state VARCHAR(20),
      country VARCHAR(20),
      established_date DATE,
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id)
    );

    -- Book_Author
    CREATE TABLE Book_Author (
      id INT(13) NOT NULL AUTO_INCREMENT,
      book_id INT(13),
      author_id INT(13),
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id)
    );

    -- Author
    CREATE TABLE Author (
      id INT(13) NOT NULL AUTO_INCREMENT,
      name VARCHAR(32) NOT NULL,
      birth_date DATE,
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id)
    );

    -- Book_Category
    CREATE TABLE Book_Category (
      id INT(13) NOT NULL AUTO_INCREMENT,
      book_id INT(13),
      category_id INT(13),
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id)
    );

    -- Category
    CREATE TABLE Category (
      id INT(13) NOT NULL AUTO_INCREMENT,
      name VARCHAR(32) UNIQUE NOT NULL,
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id),
      UNIQUE (name)
    );

    -- Inventory
    CREATE TABLE Inventory (
      id INT(13) NOT NULL AUTO_INCREMENT,
      book_id INT(13),
      quantity INT(13) NOT NULL,
      status VARCHAR(10) NOT NULL,
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id),
      UNIQUE (book_id)
    );

    -- InventoryOrder
    CREATE TABLE InventoryOrder (
      id INT(13) NOT NULL AUTO_INCREMENT,
      inventory_id INT(13),
      cost DECIMAL(7,2) NOT NULL,
      orig_quantity INT(13) NOT NULL,
      cur_quantity INT(13) NOT NULL,
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id)
    );

    -- Cart
    CREATE TABLE Cart (
      id INT(13) NOT NULL AUTO_INCREMENT,
      user_id INT(13),
      status VARCHAR(10) NOT NULL,
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id)
    );

    -- CartItem
    CREATE TABLE CartItem (
      id INT(13) NOT NULL AUTO_INCREMENT,
      cart_id INT(13),
      book_id INT(13),
      quantity INT(10),
      status VARCHAR(10) NOT NULL,
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id)
    );

    -- Order
    CREATE TABLE `Order` (
      id INT(13) NOT NULL AUTO_INCREMENT,
      user_id INT(13),
      cart_id INT(13),
      shipping DECIMAL(7,2) NOT NULL,
      tax DECIMAL(7,2) NOT NULL,
      status VARCHAR(10) NOT NULL,
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id),
      UNIQUE (cart_id)
    );

    -- OrderItem
    CREATE TABLE OrderItem (
      id INT(13) NOT NULL AUTO_INCREMENT,
      order_id INT(13),
      book_id INT(13),
      quantity INT(10),
      cost DECIMAL(7,2) NOT NULL,
      price DECIMAL(7,2) NOT NULL,
      status VARCHAR(10) NOT NULL,
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id)
    );

    -- OrderPayment
    CREATE TABLE OrderPayment (
      id INT(13) NOT NULL AUTO_INCREMENT,
      order_id INT(13),
      billing_id INT(13),
      price DECIMAL(7,2) NOT NULL,
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id)
    );

    -- User
    CREATE TABLE `User` (
      id INT(13) NOT NULL AUTO_INCREMENT,
      username VARCHAR(32) UNIQUE NOT NULL,
      name VARCHAR(64),
      email VARCHAR(64) UNIQUE NOT NULL,
      password VARCHAR(64) NOT NULL,
      phone INT(15),
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id),
      UNIQUE (email),
      UNIQUE (username)
    );

    -- Admin
    CREATE TABLE `Admin` (
      id INT(13) NOT NULL AUTO_INCREMENT,
      user_id INT(13),
      `level` VARCHAR(8) NOT NULL,
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id),
      UNIQUE (user_id)
    );

    -- UserAddress
    CREATE TABLE UserAddress (
      id INT(13) NOT NULL AUTO_INCREMENT,
      user_id INT(13),
      name VARCHAR(64) NOT NULL,
      address1 VARCHAR(32) NOT NULL,
      address2 VARCHAR(32),
      city VARCHAR(20) NOT NULL,
      state VARCHAR(20),
      country VARCHAR(20) NOT NULL,
      zip INT(10),
      status VARCHAR(10) NOT NULL,
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id)
    );

    -- Billing
    CREATE TABLE Billing (
      id INT(13) NOT NULL AUTO_INCREMENT,
      user_id INT(13),
      `type` VARCHAR(12),
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id)
    );

    -- Creditcard
    CREATE TABLE Creditcard (
      id INT(13) NOT NULL AUTO_INCREMENT,
      address_id INT(13),
      billing_id INT(13),
      name VARCHAR(64) NOT NULL,
      cc_number INT(16) NOT NULL,
      sec_number INT(4) NOT NULL,
      exp_date DATE NOT NULL,
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id),
      UNIQUE (billing_id)
    );

    -- Giftcard
    CREATE TABLE Giftcard (
      id INT(13) NOT NULL AUTO_INCREMENT,
      billing_id INT(13),
      `number` VARCHAR(24) UNIQUE NOT NULL,
      pin INT(4) NOT NULL,
      date_created DATETIME NOT NULL,
      date_modified DATETIME NOT NULL,
      PRIMARY KEY(id),
      UNIQUE (`number`),
      UNIQUE (billing_id)
    );
