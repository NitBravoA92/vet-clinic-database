/* Database schema to keep the structure of entire database. */

-- Create database
CREATE DATABASE vet_clinic;

CREATE TABLE IF NOT EXISTS animals (
    id serial PRIMARY KEY,
    name varchar(100) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal(5, 2),
);
