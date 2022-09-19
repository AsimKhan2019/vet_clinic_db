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


-- Inserting in vets into the vets 

INSERT INTO vets (name, age,date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');

INSERT INTO vets (name, age,date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');

INSERT INTO vets (name, age,date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');

INSERT INTO vets (name, age,date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');



--Inserting data into the specialization table 

DO 
	LANGUAGE plpgsql $$
DECLARE 
	pokemonID INTEGER;
	williamID INTEGER;
	stephanieID INTEGER;
	digimonID INTEGER;
	jackID INTEGER;
BEGIN
	SELECT id INTO pokemonID FROM "Species" WHERE name = 'Pokemon';
	SELECT id INTO digimonID FROM "Species" WHERE name = 'Digimon';
	SELECT id INTO williamID FROM vets WHERE name = 'William Tatcher';
	SELECT id INTO stephanieID FROM vets WHERE name = 'Stephanie Mendez';
	SELECT id INTO jackID FROM vets WHERE name = 'Jack Harkness';
	INSERT INTO specializations (species_id, vet_id) VALUES (pokemonID, williamID);
	INSERT INTO specializations (species_id, vet_id) VALUES (pokemonID, stephanieID);
	INSERT INTO specializations (species_id, vet_id) VALUES (digimonID, stephanieID);
	INSERT INTO specializations (species_id, vet_id) VALUES (digimonID, jackID);
END $$;


--Inserting data into visits table 

DO 
	LANGUAGE plpgsql $$
DECLARE 
	agumonID INTEGER;
	williamID INTEGER;
	blossomID INTEGER;
	stephanieID INTEGER;
BEGIN
	SELECT id INTO agumonID FROM animals WHERE name = 'Agumon';
	SELECT id INTO blossomID FROM animals WHERE name = 'Blossom';
	SELECT id INTO williamID FROM vets WHERE name = 'William Tatcher';
	SELECT id INTO stephanieID FROM vets WHERE name = 'Stephanie Mendez';
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (agumonID, williamID, '2020-05-24');
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (agumonID, stephanieID,'2020-07-22');
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (blossomID, stephanieID,'2020-05-24');
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (blossomID, williamID,'2021-01-11');
END $$;


--Inserting more data into visits table 

DO 
	LANGUAGE plpgsql $$
DECLARE 
	boarmonID INTEGER;
	maisyID INTEGER;
BEGIN
	SELECT id INTO boarmonID FROM animals WHERE name = 'Boarmon';
	SELECT id INTO maisyID FROM vets WHERE name = 'Maisy Smith';
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (boarmonID, maisyID, '2019-01-24');
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (boarmonID, maisyID,'2019-05-15');
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (boarmonID, maisyID,'2020-02-27');
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (boarmonID, maisyID,'2020-08-03');
END $$;


--Inserting more data into visits table 

DO 
	LANGUAGE plpgsql $$
DECLARE 
	squirtleID INTEGER;
	angemonID INTEGER;
	stephanieID INTEGER;
	jackID INTEGER;
BEGIN
	SELECT id INTO squirtleID FROM animals WHERE name = 'Squirtle';
	SELECT id INTO angemonID FROM animals WHERE name = 'Angemon';
	SELECT id INTO stephanieID FROM vets WHERE name = 'Stephanie Mendez';
	SELECT id INTO jackID FROM vets WHERE name = 'Jack Harkness';
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (squirtleID, stephanieID, '2019-09-29');
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (angemonID, jackID,'2020-10-03');
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (angemonID, jackID,'2020-11-04');
END $$;

--Inserting more data into visits table 

DO 
	LANGUAGE plpgsql $$
DECLARE 
	plantmonID INTEGER;
	maisyID INTEGER;
	williamID INTEGER;
BEGIN
	SELECT id INTO plantmonID FROM animals WHERE name = 'Plantmon';
	SELECT id INTO maisyID FROM vets WHERE name = 'Maisy Smith';
	SELECT id INTO williamID FROM vets WHERE name = 'William Tatcher';
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (plantmonID, maisyID, '2019-12-21');
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (plantmonID, williamID,'2020-08-10');
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (plantmonID, maisyID,'2021-04-07');
END $$;


--Inserting more data into visits table 

DO 
	LANGUAGE plpgsql $$
DECLARE 
	pikachuID INTEGER;
	gabumonID INTEGER;
	maisyID INTEGER;
	jackID INTEGER;
BEGIN
	SELECT id INTO pikachuID FROM animals WHERE name = 'Pikachu';
	SELECT id INTO gabumonID FROM animals WHERE name = 'Gabumon';
	SELECT id INTO maisyID FROM vets WHERE name = 'Maisy Smith';
	SELECT id INTO jackID FROM vets WHERE name = 'Jack Harkness';
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (gabumonID, jackID, '2021-02-02');
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (pikachuID, maisyID,'2020-01-05');
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (pikachuID, maisyID,'2020-05-14');
END $$;


--Inserting data into visits table 

DO 
	LANGUAGE plpgsql $$
DECLARE 
	devimonID INTEGER;
	charmandarID INTEGER;
	stephanieID INTEGER;
	jackID INTEGER;
BEGIN
	SELECT id INTO devimonID FROM animals WHERE name = 'Devimon';
	SELECT id INTO charmandarID FROM animals WHERE name = 'Charmandar';
	SELECT id INTO stephanieID FROM vets WHERE name = 'Stephanie Mendez';
	SELECT id INTO jackID FROM vets WHERE name = 'Jack Harkness';
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (devimonID, stephanieID, '2021-05-04');
	INSERT INTO visits (animal_id, vet_id,date_of_visit) VALUES (charmandarID, jackID,'2021-02-24');
END $$;


--Insertion for visitors data 

INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

INSERT INTO "Owners" (full_name, email) SELECT 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';