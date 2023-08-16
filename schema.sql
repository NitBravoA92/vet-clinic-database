/* Database schema to keep the structure of entire database. */

-- Create database
CREATE DATABASE vet_clinic;

-- Create animals table
CREATE TABLE IF NOT EXISTS animals (
    id serial PRIMARY KEY,
    name varchar(100) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal(5, 2),
);

-- Add species column to the animals table
ALTER TABLE animals ADD species VARCHAR (100);

-- Create the owners table
CREATE TABLE IF NOT EXISTS owners(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    age INT
);

-- Create the species table
CREATE TABLE IF NOT EXISTS species(
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL
);

-- Remove the column species from the animals table
ALTER TABLE animals DROP COLUMN species;
