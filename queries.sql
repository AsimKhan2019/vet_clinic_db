SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name='Pikachu';

SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

SELECT * FROM animals WHERE name <> 'Gabumon';

SELECT * FROM animals WHERE RIGHT(name, 3) = 'mon';

SELECT * FROM animals WHERE neutered = TRUE;

SELECT * FROM animals WHERE weight >= 10.4 AND weight <= 17.3;

SELECT name,escape_attempts FROM animals WHERE weight > 10.5;

SELECT name FROM animals WHERE date_part('year',date_of_birth) >= 2016 AND date_part('year',date_of_birth) <= 2019;

--Microverse 2nd exercise 

--Delete all data from animals table then rollback 
BEGIN TRANSACTION;
TRUNCATE animals;
ROLLBACK;

--Update animals table with the new species profile
BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE RIGHT(name, 3) = 'mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

--Perform delete transactions using rollbacks and savepoints
BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT POINT1;
UPDATE animals SET weight = (weight * -1);
ROLLBACK TO POINT1;
UPDATE animals SET weight = (weight * -1) WHERE weight < 0;
COMMIT;

--Perform altering column to unknown or unspecified
BEGIN TRANSACTION;
ALTER TABLE animals ALTER COLUMN species TYPE UNKNOWN;
ROLLBACK;

BEGIN TRANSACTION;
ALTER TABLE animals ALTER COLUMN species TYPE UNSPECIFIED;
ROLLBACK;

BEGIN TRANSACTION;
ALTER TABLE animals ALTER COLUMN species TYPE unknown;
ROLLBACK;

BEGIN TRANSACTION;
ALTER TABLE animals ALTER COLUMN species TYPE unspecified;
ROLLBACK;

--Perform altering column to another data type 

BEGIN TRANSACTION;
ALTER TABLE animals ALTER COLUMN species TYPE name;
ROLLBACK;

--Answer to query questions

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight) FROM animals;

SELECT MAX(escape_attempts), neutered FROM animals GROUP BY neutered;

SELECT MAX(weight), MIN(weight), species FROM animals GROUP BY species;

SELECT AVG(escape_attempts), species  FROM animals WHERE date_part('year',date_of_birth) >= 1990 AND da
te_part('year',date_of_birth) <= 2000 GROUP BY species;
