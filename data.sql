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


-- Vet WIlliam Tatcher is a specialist in Pokemon animals
INSERT INTO specializations (vet_id, species_id) VALUES (1, 1);

-- Vet Stephanie Mendez is a specialist in Pokemon animals
INSERT INTO specializations (vet_id, species_id) VALUES (3, 1);

-- Vet Stephanie Mendez is a specialist in Digimon animals
INSERT INTO specializations (vet_id, species_id) VALUES (3, 2);

-- Vet Jack Harkness is a specialist in Digimon animals
INSERT INTO specializations (vet_id, species_id) VALUES (4, 2);

-- Agumon visited William Tatcher
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (1, 1, '2020-05-24');

-- Agumon visited Stephanie Mendez
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (1, 3, '2020-07-22');

-- Gabumon visited Jack Harkness
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (2, 4, '2021-02-02');

-- Pikachu visited Maisy Smith
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (3, 2, '2020-01-05');
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (3, 2, '2020-03-08');
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (3, 2, '2020-05-14');

-- Devimon visited Stephanie Mendez
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (4, 3, '2021-05-04');

-- Charmander visited Jack Harkness
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (5, 4, '2021-02-24');

-- Plantmon visited Maisy Smith
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (6, 2, '2019-12-21');

-- Plantmon visited William Tatcher
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (6, 1, '2020-08-10');

-- Plantmon visited Maisy Smith
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (6, 2, '2021-04-07');

-- Squirtle visited Stephanie Mendez
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (7, 3, '2019-09-29');

-- Angemon visited Jack Harkness
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (8, 4, '2020-10-03');
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (8, 4, '2020-11-04');

-- Boarmon visited Maisy Smith
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (9, 2, '2019-01-24');
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (9, 2, '2019-05-15');
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (9, 2, '2020-02-27');
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (9, 2, '2020-08-03');

-- Blossom visited Stephanie Mendez
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (10, 3, '2020-05-24');

-- Blossom visited William Tatcher
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (10, 1, '2021-01-11');

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
INSERT INTO owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
