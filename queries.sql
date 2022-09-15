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


--Answer queries for Third Microverse Exercise 

SELECT name FROM animals A JOIN "Owners" O ON A.owner_id = O.id AND O.full_name = 'Melody Pond';

SELECT * FROM animals A JOIN "Species" S ON A.species_id = S.id AND S."name" = 'Pokemon';

SELECT A.name, O.full_name FROM animals A RIGHT JOIN "Owners" O ON A.owner_id = O.id;

SELECT COUNT(A.name), S."name" FROM animals as A INNER JOIN "Species" as S ON A.species_id = S.id GROUP BY S."name";

SELECT DISTINCT A."name" FROM animals A JOIN "Owners" O ON A.owner_id = O.id JOIN "Species" S ON A.species_id = S.id WHERE O.full_name = 'Jennifer Orwell' AND S."name" = 'Digimon';

SELECT DISTINCT A."name", A.escape_attempts FROM animals A JOIN "Owners" O ON A.owner_id = O.id WHERE O.full_name = 'Dean Winchester';

SELECT DISTINCT A."name" FROM animals A JOIN "Owners" O ON A.owner_id = O.id WHERE O.full_name = 'Dean Winchester' AND A.escape_attempts = 0;

SELECT COUNT(A.name), O.full_name FROM animals A JOIN "Owners" O ON A.owner_id = O.id GROUP BY O.full_name;


--Answer queries for thre fourth Microverse Exercise

SELECT DISTINCT A.name, v.date_of_visit FROM animals A JOIN visits v ON A.id = v.animal_id JOIN vets ON vets.id = v.vet_id WHERE vets."name" = 'William Tatcher' ORDER BY v.date_of_visit DESC LIMIT 1;

SELECT DISTINCT A.name, v.date_of_visit FROM animals A JOIN visits v ON A.id = v.animal_id JOIN vets ON vets.id = v.vet_id WHERE vets."name" = 'Stephanie Mendez';

SELECT v.name, s.name FROM vets v LEFT JOIN specializations sp ON v.id = sp.vet_id LEFT JOIN "Species" s ON s.id = sp.species_id;

SELECT DISTINCT A.name, v.date_of_visit FROM animals A JOIN visits v ON A.id = v.animal_id JOIN vets ON vets.id = v.vet_id WHERE vets."name" = 'Maisy Smith' AND (v.date_of_visit >= '2021-04-01' AND v.date_of_visit <= '2021-04-30');

SELECT DISTINCT A.name, v.date_of_visit FROM animals A JOIN visits v ON A.id = v.animal_id JOIN vets ON vets.id = v.vet_id WHERE vets."name" = 'Stephanie Mendez' AND (v.date_of_visit >= '2020-04-01' AND v.date_of_visit <= '2020-04-30');

SELECT A.name, COUNT(A.name) FROM animals A JOIN visits v ON A.id = v.animal_id GROUP BY A.name ORDER BY COUNT(A.name) DESC LIMIT 1;

SELECT A.name, v.date_of_visit, vt.name FROM animals A JOIN visits v ON A.id = v.animal_id JOIN vets vt ON vt.id = v.vet_id WHERE vt.name = 'Maisy Smith' ORDER BY v.date_of_visit ASC LIMIT 1;

SELECT "Species".name, vets.name FROM vets FULL JOIN specializations ON specializations.vet_id = vets.id FULL JOIN "Species" ON "Species".id = specializations.species_id; 

SELECT a.name, s.name, vt.name FROM vets vt JOIN visits v ON vt.id = v.vet_id JOIN animals a ON a.id = v.animal_id JOIN "Species" s ON s.id = a.species_id JOIN specilizations sp ON sp.vet_id = vt.id JOIN "Species" spc ON spc.id = sp.species_id WHERE s.id <> spc.id;

SELECT vs.date_of_visit, v.name, a.name, s.name FROM visits vs JOIN vets v ON v.id = vs.vet_id JOIN animals a ON a.id = vs.animal_id JOIN "Species" s ON a.species_id = s.id WHERE v.name = 'Maisy Smith' ORDER BY s."name";