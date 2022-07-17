-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  solar_system_id REFERENCES solar_systems ON DELETE CASCADE
);

CREATE TABLE solar_systems
(
  id SERIAL PRIMARY KEY,
  central_body TEXT NOT NULL,
  galaxy TEXT NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  planet_id REFERENCES planets ON DELETE CASCADE,
  name TEXT NOT NULL
);

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- should this even be a table or should the database just be called milky-way?
INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way');

INSERT INTO solar_systems
  (central_body, galaxy_id)
VALUES
  ('The Sun', 1),
  ('Proxima Centauri', 1),
  ('Gliese 876', 1)

INSERT INTO planets
  (name, orbital_period_in_years, solar_system_id)
VALUES
  ('Earth', 1.00, 1),
  ('Mars', 1.88, 1),
  ('Venus', 0.62, 1 '{}'),
  ('Neptune', 164.8, 1 ),
  ('Proxima Centauri b', 0.03, 2),
  ('Gliese 876 b', 0.23, 3);

INSERT INTO moons
  (name, planet_id)
VALUES
  ("The Moon", 1),
  ("Phobos", 2),
  ("Deimos", 2),
  ("Naiad", 3),
  ("Thalassa", 3),
  ("Despina", 3),
  ("Galatea", 3),
  ("Larissa", 3),
  ("S/2004 N 1", 3),
  ("Proteus", 3),
  ("Triton", 3),
  ("Nereid", 3),
  ("Halimede", 3),
  ("Sao", 3),
  ("Laomedeia", 3),
  ("Psamathe", 3),
  ("Neso", 3);
