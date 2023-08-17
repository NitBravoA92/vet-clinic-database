/* Populate database with sample data. */

-- These queries will create new records in the animals table for each of the following animals:

-- Animal: Agumon
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, true, 10.23);

-- Animal: Gabumon
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, true, 8.00);

-- Animal: Pikachu
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);

-- Animal: Devimon
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, true, 11.00);

-- Animal: Charmander
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, false, -11);

-- Animal: Plantmon
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);

-- Animal: Squirtle
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);

-- Animal: Angemon
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, true, -45);

-- Animal: Boarmon
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);

-- Animal: Blossom
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, true, 17);

-- Animal: Ditto
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-05-14', 4, true, 22);


-- Owner: Sam Smith
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);

-- Owner: Jennifer Orwell
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);

-- Owner: Bob
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);

-- Owner: Melody Pond
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);

-- Owner: Dean Winchester
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);

-- Owner: Jodie Whittaker
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);


-- Specie: Pokemon
INSERT INTO species (name) VALUES('Pokemon');

-- Specie: Digimon
INSERT INTO species (name) VALUES('Digimon');


-- Add the species 'Digimon' to animals whose name ends in 'mon'
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

-- Add the species 'Pokemon' to animals whose name not end in 'mon'
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';


-- Set Sam Smith as the owner of Agumon
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';

-- Set Jennifer Orwell as the owner of Gabumon and Pikachu
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';

-- Set Bob as the owner of Devimon and Plantmon
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';

-- Set Melody Pond as the owner of Charmander, Squirtle and Blossom
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

--Set Dean Winchester as the owner of Angemon and Boarmon
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

-- Vet: William Tatcher
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');

-- Vet: Maisy Smith
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');

-- Vet: Stephanie Mendez
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');

-- Vet: Jack Harkness
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');
