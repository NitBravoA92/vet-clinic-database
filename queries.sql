/*Queries that provide answers to the questions from all projects.*/

-- This query will return all animals whose name ends in "mon".
SELECT * FROM animals WHERE name LIKE '%mon';

-- This query will return all animals' names that were born between 2016 and 2019.
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- This query will return all animals' names that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

-- This query will return all animals' dates of birth that are named as Agumon or Pikachu.
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

-- This query will return all animals' names and dates of birth that have weight more than 10.5kg
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

-- This query will return all animals' data that are neutered.
SELECT * FROM animals WHERE neutered = true;

-- This query will return all animals' data that are not named Gabumon.
SELECT * FROM animals WHERE name != 'Gabumon';

-- This query will return all animals' data with a weight between 10.4kg and 17.3kg
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


-- Begin first Transaction
BEGIN;

-- Update the species column
UPDATE animals SET species = 'unspecified';

-- Check the changes are done well
SELECT * FROM animals;

-- Cancel the transaction
ROLLBACK;

-- Check the changes are undone
SELECT * FROM animals;


-- Begin second Transaction
BEGIN;

-- Add the string 'digimon' to the species column where the name of the animal ends on mon
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

-- Add the string 'pokemon' to the species column where the species column is null or empty
UPDATE animals SET species = 'pokemon' WHERE species IS NULL OR species = '';

-- Check the changes are done
SELECT * FROM animals;

-- Save the changes
COMMIT;

-- Check the changes persist
SELECT * FROM animals;



-- Begin third Transaction
BEGIN;

-- Delete all records in the animals table
DELETE FROM animals;

-- Check the changes are done
SELECT * FROM animals;

-- Cancel the transaction
ROLLBACK;

-- Check the changes are undone
SELECT * FROM animals;



-- Begin fourth Transaction
BEGIN;

-- Delete all animals that have born after January 01, 2022
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

-- Create a savepoint to rollback 
SAVEPOINT delete_savepoint;

-- Update the animal table to change the sign of the weight
UPDATE animals SET weight_kg = weight_kg * -1;

-- Cancel the transaction
ROLLBACK TO SAVEPOINT delete_savepoint;

-- Update the animals table to change the signs of all negative weights
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

-- Save the changes
COMMIT;

-- Check if the changes persist
SELECT * FROM animals;


-- Analyze the animals data using Aggregate Functions


-- Question 1: How many animals are there?

-- Total number of animals
SELECT COUNT(*) AS total_animals FROM animals;



-- Question 2: How many animals have never tried to escape?

-- The number of animals that have never tried to escape
SELECT COUNT(*) AS animals_never_escape FROM animals WHERE escape_attempts = 0;



-- Question 3: What is the average weight of animals?

-- The average weight of animals
SELECT AVG(weight_kg) AS animals_average_weight FROM animals;



-- Question 4: Who escapes the most, neutered or not neutered animals?

-- The animals that escape the most grouped by neutered status
SELECT neutered AS neutered_animals, MAX(escape_attempts) AS animals_escape_the_most FROM animals GROUP BY neutered;



-- Question 5: What is the minimum and maximum weight of each type of animal?

-- minimum and maximum weight of each type of animal
SELECT species AS animals_type, MIN(weight_kg) AS animals_minimum_weight, MAX(weight_kg) AS animals_maximum_weight FROM animals GROUP BY species;



-- Question 6: What is the average number of escape attempts per animal type of those born between 1990 and 2000?

-- The average number of escapes by type of animal
SELECT species AS animals_type, AVG(escape_attempts) animals_escapes_average FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;
