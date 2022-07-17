-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE player
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  team_id REFERENCES teams ON DELETE CASCADE
);

CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  match_id REFERENCES matches ON DELETE CASCADE,
  player_id REFERENCES players ON DELETE NULL
);

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE matches
(
  id SERIAL PRIMARY KEY,
  team_home_id REFERENCES teams ON DELETE NULL,
  team_away_id REFERENCES teams ON DELETE NULL,
  season_id REFERENCES seasons ON DELETE NULL,
  referee_id REFERENCES referee ON DELETE NULL
);

CREATE TABLE seasons
(
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

CREATE TABLE results
(
    id SERIAL PRIMARY KEY,
    team_id REFERENCES teams ON DELETE CASCADE,
    match_id REFERENCES matches ON DELETE CASCADE
);

CREATE TABLE referees 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);