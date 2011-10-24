-- Authors: 	Ryan McGowan
--		Alex Notwell
-- First we create the database

CREATE DATABASE bitsbooks;
-- Set our default storage engine
SET storage_engine=INNODB;

-- Step 1: Table Creation
-- Book
CREATE TABLE Book (
  id INT(13) NOT NULL,
  isbn INT(13) NOT NULL,
  title VARCHAR(64) NOT NULL,
  publisher_id INT(13),
  price DECIMAL(7,2) NOT NULL,
  date_created DATETIME NOT NULL,
  date_modified DATETIME NOT NULL,
  PRIMARY_KEY(id),
  INDEX(isbn), INDEX(publisher_id), INDEX(title)
);

-- Publisher
CREATE TABLE Publisher (
  id INT(13) NOT NULL,
  name VARCHAR(32) NOT NULL,
  city VARCHAR(20),
  state VARCHAR(20),
  country VARCHAR(20),
  established_date DATE,
  date_created DATETIME NOT NULL,
  date_modified DATETIME NOT NULL,
  PRIMARY_KEY(id),
  INDEX(name)
);

-- Book_Author
CREATE TABLE Book_Author (
  id INT(13) NOT NULL,
  book_id INT(13),
  author_id INT(13),
  date_created DATETIME NOT NULL,
  date_modified DATETIME NOT NULL,
  PRIMARY_KEY(id),
  INDEX(book_id), INDEX(author_id)
);

-- Author
CREATE TABLE Author (
  id INT(13) NOT NULL,
  name VARCHAR(32) NOT NULL,
  birth_date DATE,
  date_created DATETIME NOT NULL,
  date_modified DATETIME NOT NULL,
  PRIMARY_KEY(id),
  INDEX(name)
);

-- Book_Category
CREATE TABLE Book_Category (
  id INT(13) NOT NULL,
  book_id INT(13),
  cateogry_id INT(13),
  date_created DATETIME NOT NULL,
  date_modified DATETIME NOT NULL,
  PRIMARY_KEY(id),
  INDEX(book_id), INDEX(cateogry_id)
);

-- Category
CREATE TABLE Category (
  id INT(13) NOT NULL,
  name VARCHAR(32) NOT NULL,
  date_created DATETIME NOT NULL,
  date_modified DATETIME NOT NULL,
  PRIMARY_KEY(id),
  INDEX(name)
);

-- Inventory
CREATE TABLE Inventory (
  id INT(13) NOT NULL,
  book_id INT(13),
  quantity INT(13) NOT NULL,
  status VARCHAR(10) NOT NULL,
  date_created DATETIME NOT NULL,
  date_modified DATETIME NOT NULL,
  PRIMARY_KEY(id),
  INDEX(book_id)
);

-- InventoryOrder
CREATE TABLE InventoryOrder (
  id INT(13) NOT NULL,
  inventory_id INT(13),
  cost DECIMAL(7,2) NOT NULL,
  orig_quantity INT(13) NOT NULL,
  cur_quantity INT(13) NOT NULL,
  date_created DATETIME NOT NULL,
  date_modified DATETIME NOT NULL,
  PRIMARY_KEY(id),
  INDEX(inventory_id)
);

-- Cart
CREATE TABLE Cart (
  id INT(13) NOT NULL,
  order_id INT(13),
  status VARCHAR(10) NOT NULL,
  date_created DATETIME NOT NULL,
  date_modified DATETIME NOT NULL,
  PRIMARY_KEY(id),
  INDEX(status)
);

-- CartItem
CREATE TABLE CartItem (
  id INT(13) NOT NULL,
  cart_id INT(13),
  book_id INT(13),
  quantity INT(10),
  status VARCHAR(10) NOT NULL,
  date_created DATETIME NOT NULL,
  date_modified DATETIME NOT NULL,
  PRIMARY_KEY(id),
  INDEX(cart_id)
);

-- Order
CREATE TABLE `Order` (
  id INT(13) NOT NULL,
  user_id INT(13),
  cart_id INT(13),
  billing_id INT(13),
  subtotal DECIMAL(7,2) NOT NULL,
  shipping DECIMAL(7,2) NOT NULL,
  tax DECIMAL(7,2) NOT NULL,
  status VARCHAR(10) NOT NULL,
  date_created DATETIME NOT NULL,
  date_modified DATETIME NOT NULL,
  PRIMARY_KEY(id),
  INDEX(user_id)
);

-- OrderItem
CREATE TABLE OrderItem (
  id INT(13) NOT NULL,
  order_id INT(13),
  quantity INT(10),
  cost DECIMAL(7,2) NOT NULL,
  price DECIMAL(7,2) NOT NULL,
  status VARCHAR(10) NOT NULL,
  date_created DATETIME NOT NULL,
  date_modified DATETIME NOT NULL,
  PRIMARY_KEY(id),
  INDEX(order_id)
);

-- User
CREATE TABLE `User` (
  id INT(13) NOT NULL,
  username VARCHAR(32) NOT NULL,
  name VARCHAR(64),
  email VARCHAR(64) NOT NULL,
  password VARCHAR(64) NOT NULL,
  phone INT(15),
  date_created DATETIME NOT NULL,
  date_modified DATETIME NOT NULL,
  PRIMARY_KEY(id),
  INDEX(email)
);

-- UserAddress
CREATE TABLE UserAddress (
  id INT(13) NOT NULL,
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
  PRIMARY_KEY(id),
  INDEX(user_id)
);

-- Billing
CREATE TABLE Billing (
  id INT(13) NOT NULL,
  user_id INT(13),
  address_id INT(13),
  name VARCHAR(64) NOT NULL,
  cc_number INT(16) NOT NULL,
  sec_number INT(4) NOT NULL,
  exp_date DATE NOT NULL,
  date_created DATETIME NOT NULL,
  date_modified DATETIME NOT NULL,
  PRIMARY_KEY(id),
  INDEX(user_id)
);
