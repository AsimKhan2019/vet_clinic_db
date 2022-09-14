BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT POINT1;
UPDATE animals SET weight = (weight * -1);
ROLLBACK TO POINT1;
UPDATE animals SET weight = (weight * -1) WHERE weight < 0;
COMMIT;