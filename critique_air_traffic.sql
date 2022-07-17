-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  flight_id REFERENCES flights
  
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL,
)

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  airline_id REFERENCES airlines ON DELETE CASCADE,
  depart_from REFERENCES airports ON DELETE CASCADE,
  arrive_at REFERENCES airports ON DELETE CASCADE
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
)

CREATE TABLE airports
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  country TEXT NOT NULL
)

INSERT INTO airlines
  (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO airports
  (city, country)
VALUES
  ('Washington DC', 'United States'),
  ('Seattle', 'United States'),
  ('Tokyo', 'Japan'),
  ('London', 'United Kingdom'),
  ('Los Angeles', 'United States'),
  ('Las Vegas', 'United States'),
  ('Mexico City', 'Mexico'),
  ('Paris', 'France'),
  ('Casablanca', 'Morocco'),
  ('Dubai', 'UAE'),
  ('Beijing', 'China'),
  ('New York', 'United States'),
  ('Charlotte', 'United States'),
  ('Cedar Rapids', 'United States'), 
  ('Chicago', 'United States'),
  ('New Orleans', 'United States'),
  ('Sao Paolo', 'Brazil'),
  ('Santiago', 'Chile');

INSERT INTO flights
  (departure, arrival, airline, depart_from, arrive_at)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 4),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 6),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 7),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 9),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 11),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 13),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 15),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 16),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 18);

INSERT INTO tickets
  (first_name, last_name, seat, flight_id)
VALUES
  ('Jennifer', 'Finch', '33B', 1),
  ('Thadeus', 'Gathercoal', '8A', 2),
  ('Sonja', 'Pauley', '12F', 3),
  ('Jennifer', 'Finch', '20A', 4),
  ('Waneta', 'Skeleton', '23D', 5),
  ('Thadeus', 'Gathercoal', '18C', 6),
  ('Berkie', 'Wycliff', '9E', 7),
  ('Alvin', 'Leathes', '1A', 8),
  ('Berkie', 'Wycliff', '32B', 9),
  ('Cory', 'Squibbes', '10D', 10);