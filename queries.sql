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




-- Analyze the animals, species and owners data using JOINs clauses to link data from related tables



-- Question 1: What animals belong to Melody Pond?

-- Show all animals owned by Melody Pond
SELECT o.full_name AS animal_owner, a.name AS animal_name FROM animals a INNER JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Melody Pond';



-- Question 2: List of all animals that are pokemon.

-- Show all 'Pokemon' type animals
SELECT a.name AS animal_name, s.name AS animal_type FROM animals a INNER JOIN species s ON a.species_id = s.id WHERE s.name = 'Pokemon';



-- Question 3: List all owners and their animals, remember to include those that don't own any animal.

-- Show all animals owners and their animals
SELECT o.full_name AS animal_owner, a.name AS animal_name FROM animals a RIGHT JOIN owners o ON a.owner_id = o.id;



-- Question 4: How many animals are there per species?

-- Show all animals by species
SELECT s.name AS specie, COUNT(a.name) AS total_animals FROM animals a INNER JOIN species s ON a.species_id = s.id GROUP BY s.name; 



-- Question 5: List all Digimon owned by Jennifer Orwell.

-- Show all 'Digimon' type animals owned by Jennifer Orwell.
SELECT a.name AS animal_name, s.name AS animal_type, o.full_name AS animal_owner FROM animals a INNER JOIN species s ON a.species_id = s.id INNER JOIN owners o ON a.owner_id = o.id WHERE s.name = 'Digimon' AND o.full_name = 'Jennifer Orwell';



-- Question 6: List all animals owned by Dean Winchester that haven't tried to escape.

-- Show all of Dean Winchester animals that have never tried to escape.
SELECT o.full_name AS animal_owner, a.name AS animal_name, a.escape_attempts AS animal_total_escapes FROM animals a INNER JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;



-- Question 7: Who owns the most animals?

-- Show who owns the most animals.
SELECT o.full_name AS animal_owner, COUNT(a.name) AS total_animals FROM animals a INNER JOIN owners o ON a.owner_id = o.id GROUP BY o.full_name ORDER BY total_animals DESC LIMIT 1;




-- Analyze the data of the join tables (visits, specializations) using JOINs clauses and Sub-queries


-- Question 1: Who was the last animal seen by William Tatcher?
SELECT ve.name AS vet_name, a.name AS last_animal_seen, v.date_of_visit AS visit_date FROM visits v INNER JOIN animals a ON v.animal_id = a.id INNER JOIN vets ve ON v.vet_id = ve.id WHERE ve.name = 'William Tatcher' ORDER BY v.date_of_visit DESC LIMIT 1;


-- Question 2: How many different animals did Stephanie Mendez see?
SELECT ve.name AS vet_name, COUNT(DISTINCT a.id) AS total_different_animals_seen FROM visits v INNER JOIN animals a ON v.animal_id = a.id INNER JOIN vets ve ON v.vet_id = ve.id WHERE ve.name = 'Stephanie Mendez' GROUP BY ve.name;


-- Question 3: List all vets and their specialties, including vets with no specialties.
SELECT ve.name AS vet_name, ve.age AS vet_age, ve.date_of_graduation AS graduation_date, s.name AS specialty FROM specializations sp FULL OUTER JOIN vets ve ON sp.vet_id = ve.id FULL OUTER JOIN species s ON sp.species_id = s.id;


-- Question 4: List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT ve.name AS vet_name, a.name AS animal_seen, v.date_of_visit AS visit_date FROM visits v INNER JOIN animals a ON v.animal_id = a.id INNER JOIN vets ve ON v.vet_id = ve.id WHERE ve.name = 'Stephanie Mendez' AND v.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30' ORDER BY v.date_of_visit ASC;


-- Question 5: What animal has the most visits to vets?
SELECT a.name AS animal_name, COUNT(v.animal_id) AS total_visits_vet FROM visits v INNER JOIN animals a ON v.animal_id = a.id GROUP BY a.name ORDER BY total_visits_vet DESC LIMIT 1;


-- Question 6: Who was Maisy Smith's first visit?
SELECT a.name AS animal_name, v.date_of_visit AS visit_date FROM visits v INNER JOIN animals a ON v.animal_id = a.id INNER JOIN vets ve ON v.vet_id = ve.id WHERE ve.name = 'Maisy Smith' ORDER BY v.date_of_visit ASC LIMIT 1;


-- Question 7: Details for most recent visit: animal information, vet information, and date of visit.
SELECT a.*, ve.id AS vet_id, ve.name AS vet_name, ve.age AS vet_age, ve.date_of_graduation AS vet_graduation_date, v.date_of_visit AS visit_date FROM visits v INNER JOIN animals a ON v.animal_id = a.id INNER JOIN vets ve ON v.vet_id = ve.id ORDER BY visit_date DESC;


-- Question 8: How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) AS total_visits_no_specialization FROM visits v INNER JOIN animals a ON v.animal_id = a.id WHERE v.vet_id NOT IN (SELECT s.vet_id FROM specializations s WHERE s.species_id = a.species_id);


-- Question 9: What specialty should Maisy Smith consider getting? Look for the species she gets the most?
SELECT (SELECT s.name FROM species s WHERE s.id = a.species_id) AS animal_specie, COUNT(*) AS total_visits FROM visits v INNER JOIN vets ve ON v.vet_id = ve.id INNER JOIN animals a ON v.animal_id = a.id WHERE ve.name = 'Maisy Smith' GROUP BY animal_specie ORDER BY total_visits DESC;
