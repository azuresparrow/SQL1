-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album REFERENCES albums ON DELETE CASCADE
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  release_date DATE NOT NULL,
  title TEXT NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE songs_artists
(
  id SERIAL PRIMARY KEY,
  song_id REFERENCES songs ON DELETE CASCADE,
  artist_id REFERENCES artists ON DELETE CASCADE
);

CREATE TABLE songs_producers
(
  id SERIAL PRIMARY KEY,
  song_id REFERENCES songs ON DELETE CASCADE,
  artist_id REFERENCES artists ON DELETE CASCADE
);





INSERT INTO artists 
  (name) 
VALUES
  ('Hanson'),
  ('Queen'),
  ("Mariah Cary"),
  ("Boyz II Men")
  ("Lady Gaga"),
  ("Bradley Cooper")
  ("Nickelback")
  ("Jay Z"), 
  ("Alicia Keys");

INSERT INTO producers
  (name)
VALUES
  ("Dust Brothers"),
  ("Stephen Lironi"),
  ("Roy Thomas Baker"),
  ("Walter Afanasieff"),
  ("Benjamin Rice"),
  ("Rick Parashar"),
  ("Al Shux");

INSERT INTO albums 
  (title, release_date)
VALUES
  ('Middle of Nowhere', '04-15-1997'),
  ('A Night at the Opera', '10-31-1975'),
  ('Daydream', '11-14-1995'),
  ('A Star Is Born', '09-27-2018'),
  ('Silver Side Up', '08-21-2001'),
  ('The Blueprint 3', '10-20-2009');

INSERT INTO songs
  (title, duration_in_seconds, album_id)
VALUES
  ('MMMBop', 238, 1),
  ('Bohemian Rhapsody', 355, 2),
  ('One Sweet Day', 282, 3),
  ('Shallow', 216, 4),
  ('How You Remind Me', 223, 5),
  ('New York State of Mind', 276, 6);

INSERT INTO songs_artists
  (artist_id, song_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 3),
  (5, 4),
  (6, 4),
  (7, 5),
  (8, 6),
  (9, 6);

INSERT INTO songs_producers
  (producer_id, song_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 2),
  (4, 3),
  (5, 4),
  (6, 5),
  (7, 6);