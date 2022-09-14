INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight) VALUES ('Agumon','2020-02-03',0,TRUE,10.23);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight) VALUES ('Gabumon','2018-11-15',2,TRUE,8);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight) VALUES ('Pikachu','2021-01-07',1,FALSE,15.04);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight) VALUES ('Devimon','2017-05-12',5,TRUE,11);

--New Data for Exercise No. 2

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight) VALUES ('Charmandar','2020-02-08',0,FALSE,-11);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight) VALUES ('Plantmon','2021-11-15',2,TRUE,-5.7);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight) VALUES ('Squirtle','1993-04-02',3,FALSE,-12.13);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight) VALUES ('Angemon','2005-06-12',1,TRUE,-45);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight) VALUES ('Boarmon','2005-06-07',7,TRUE,20.4);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight) VALUES ('Blossom','1998-10-13',3,TRUE,17);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight) VALUES ('Ditto','2022-05-14',4,TRUE,22);


--New data for Microverse Exercise 3

INSERT INTO "Owners" (full_name,age) VALUES ('Sam Smith', 34);

INSERT INTO "Owners" (full_name,age) VALUES ('Jennifer Orwell', 19);

INSERT INTO "Owners" (full_name,age) VALUES ('Bob', 45);

INSERT INTO "Owners" (full_name,age) VALUES ('Melody Pond', 77);

INSERT INTO "Owners" (full_name,age) VALUES ('Dean Winchester', 14);

INSERT INTO "Owners" (full_name,age) VALUES ('Jodie Whittaker', 38);

INSERT INTO "Species" (name) VALUES ('Pokemon');

INSERT INTO "Species" (name) VALUES ('Digimon');


--Updating the species_id in the animals table

UPDATE animals SET species_id = (SELECT id FROM "Species" WHERE name = 'Digimon') WHERE RIGHT(name,3) = 'mon';

UPDATE animals SET species_id = (SELECT id FROM "Species" WHERE name = 'Pokemon') WHERE RIGHT(name,3) <> 'mon';


--Updating the owner_id in the animals table

UPDATE animals SET owner_id = (SELECT id from "Owners" WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';

UPDATE animals SET owner_id = (SELECT id FROM "Owners" WHERE full_name = 'Bob') WHERE name IN ('Devimon','Plantmon');

UPDATE animals SET owner_id = (SELECT id FROM "Owners" WHERE full_name = 'Melody Pond') WHERE name IN ('Charmandar','Squirtle','Blossom');

UPDATE animals SET owner_id = (SELECT id FROM "Owners" WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon','Boarmon');

UPDATE animals SET owner_id = (SELECT id FROM "Owners" WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon','Pikachu');


