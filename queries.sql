SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name='Pikachu';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE RIGHT(name, 3) = 'mon';
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE weight >= 10.4 AND weight <= 17.3;
SELECT name,escape_attempts FROM animals WHERE weight > 10.5;
SELECT name FROM animals WHERE date_part('year',date_of_birth) >= 2016 AND date_part('year',date_of_birth) <= 2019;