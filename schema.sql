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

-- Add the species_id and owner_id columns to the animals table
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD owner_id INT;

-- Add the foreign keys to the animals table
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE;
ALTER TABLE animals ADD CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES owners(id) ON DELETE CASCADE;
