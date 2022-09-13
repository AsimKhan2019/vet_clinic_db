BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE RIGHT(name, 3) = 'mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
