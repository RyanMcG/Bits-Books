-- Authors: 	Ryan McGowan
--		Alex Notwell
-- First we create the database

CREATE DATABASE bitnooks;
CREATE TABLE Book (
  id INT(11) NOT NULL,
  title VARACHAR(64) NOT NULL,
  publisher_id INT(11) NOT NULL,
  PRIMARY_KEY(id)
  -- Needs work
);
