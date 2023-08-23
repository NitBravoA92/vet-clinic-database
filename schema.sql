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

-- Add the foreign keys and and the restrictions to the animals table
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE;
ALTER TABLE animals ADD CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES owners(id) ON DELETE CASCADE;


-- Create the vets table
CREATE TABLE IF NOT EXISTS vets(
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    age INT,
    date_of_graduation DATE
);

-- Create the specializations table
CREATE TABLE IF NOT EXISTS specializations(
    vet_id INT,
    species_id INT,
    PRIMARY KEY (vet_id, species_id),
    CONSTRAINT fk_vets_id
    FOREIGN KEY (vet_id)
    REFERENCES vets(id)
    ON DELETE CASCADE,
    CONSTRAINT fk_species_id
    FOREIGN KEY (species_id)
    REFERENCES species(id)
    ON DELETE CASCADE
);

-- Create the visits table
CREATE TABLE IF NOT EXISTS visits(
    animal_id INT,
    vet_id INT,
    date_of_visit DATE,
    PRIMARY KEY (animal_id, vet_id, date_of_visit),
    CONSTRAINT fk_animal_id
    FOREIGN KEY (animal_id)
    REFERENCES animals(id)
    ON DELETE CASCADE,
    CONSTRAINT fk_vet_id
    FOREIGN KEY (vet_id)
    REFERENCES vets(id)
    ON DELETE CASCADE
);

-- Add the email column to the owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Add index for the animal_id column in the visits table
CREATE INDEX idx_visits_animal_id ON visits (animal_id);

-- Add index for the vet_id column in the visits table
CREATE INDEX idx_visits_vet_id ON visits (vet_id);

