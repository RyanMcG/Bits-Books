-- Create Database and User

-- This file does not need to be run on the CSE servers, but otherwise can be
-- used to setup a development/testing database and a User to manipulate it.

-- The following commands must be executed by a User who has the required
-- privileges.

CREATE USER bitbook WITH PASSWORD 'amazon';
CREATE DATABASE bitbook OWNER bitbook;
