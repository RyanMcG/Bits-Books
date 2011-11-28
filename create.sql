-- Authors: 	Ryan McGowan
--		Alex Notwell
-- First we create the database

-- CREATE DATABASE bitsbooks;
-- Set our default storage engine
SET storage_engine=INNODB;

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
  PRIMARY KEY(id)
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
  PRIMARY KEY(id)
);

-- Inventory
CREATE TABLE Inventory (
  id INT(13) NOT NULL AUTO_INCREMENT,
  book_id INT(13),
  quantity INT(13) NOT NULL,
  status VARCHAR(10) NOT NULL,
  date_created DATETIME NOT NULL,
  date_modified DATETIME NOT NULL,
  PRIMARY KEY(id)
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
  order_id INT(13),
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
  subtotal DECIMAL(7,2) NOT NULL,
  shipping DECIMAL(7,2) NOT NULL,
  tax DECIMAL(7,2) NOT NULL,
  status VARCHAR(10) NOT NULL,
  date_created DATETIME NOT NULL,
  date_modified DATETIME NOT NULL,
  PRIMARY KEY(id)
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
  PRIMARY KEY(id)
);

-- Admin
CREATE TABLE `Admin` (
  id INT(13) NOT NULL AUTO_INCREMENT,
  user_id INT(13),
  `level` VARCHAR(8) NOT NULL,
  date_created DATETIME NOT NULL,
  date_modified DATETIME NOT NULL,
  PRIMARY KEY(id)
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
  PRIMARY KEY(id)
);

-- Giftcard
CREATE TABLE Giftcard (
  id INT(13) NOT NULL AUTO_INCREMENT,
  billing_id INT(13),
  `number` VARCHAR(24) UNIQUE NOT NULL,
  pin INT(4) NOT NULL,
  date_created DATETIME NOT NULL,
  date_modified DATETIME NOT NULL,
  PRIMARY KEY(id)
);
