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
