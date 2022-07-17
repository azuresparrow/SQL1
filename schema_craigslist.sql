-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE category
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    username TEXT UNIQUE NOT NULL,
    prefered_region REFERENCES regions ON DELETE CASCADE
);

CREATE TABLE posts 
(
    id SERIAL PRIMARY KEY,
    region_id REFERENCES regions ON DELETE CASCADE,
    author REFERENCES users ON DELETE CASCADE
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    location TEXT NOT NULL
);