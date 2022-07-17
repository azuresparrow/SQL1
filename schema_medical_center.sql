-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  salary INTEGER NOT NULL
);

CREATE TABLE patient
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    symptoms TEXT NOT NULL,
    medicine TEXT NOT NULL,
    care_instructions TEXT NOT NULL
);

CREATE TABLE diagnosis 
(
    id SERIAL PRIMARY KEY,
    disease_id REFERENCES diseases ON DELETE SET NULL,
    visit_id REFERENCES visit ON DELETE CASCADE
    notes TEXT NOT NULL
);

CREATE TABLE visit 
(
    id SERIAL PRIMARY KEY,
    patient_id REFERENCES patient ON DELETE SET NULL,
    doctor_id REFERENCES doctor ON DELETE SET NULL,
    diagnosis_id REFERENCES diagnosis ON DELETE CASCADE,
    scheduled DATE NOT NULL,
    has_happened BOOLEAN NOT NULL,
    paid BOOLEAN NOT NULL
);