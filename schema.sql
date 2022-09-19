-- Table: animals
-- DROP TABLE IF EXISTS animals;

CREATE TABLE IF NOT EXISTS animals
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2000 CACHE 1 ),
    name text COLLATE pg_catalog."default" NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weight double precision NOT NULL,
    CONSTRAINT animals_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS animals
    OWNER to admin;

COMMENT ON TABLE animals
    IS 'A microverse exercise to create an animal table.';


-- Column: animals.species

-- ALTER TABLE IF EXISTS animals DROP COLUMN IF EXISTS species;

ALTER TABLE IF EXISTS animals
    ADD COLUMN species text COLLATE pg_catalog."default";

COMMENT ON COLUMN animals.species
    IS 'Another exercise from Microverse';


-- Table: Owners

-- DROP TABLE IF EXISTS "Owners";

CREATE TABLE IF NOT EXISTS "Owners"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2000 CACHE 1 ),
    full_name text COLLATE pg_catalog."default" NOT NULL,
    age integer NOT NULL,
    CONSTRAINT "Owners_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "Owners"
    OWNER to admin;

COMMENT ON TABLE "Owners"
    IS 'This is the third exercise from Microverse';


-- Table: Species

-- DROP TABLE IF EXISTS "Species";

CREATE TABLE IF NOT EXISTS "Species"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2000 CACHE 1 ),
    name text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Species_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "Species"
    OWNER to admin;

COMMENT ON TABLE "Species"
    IS 'This is the third exercise from Microverse';


-- Table: animals

-- DROP TABLE IF EXISTS animals;

CREATE TABLE IF NOT EXISTS animals
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2000 CACHE 1 ),
    name text COLLATE pg_catalog."default" NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weight double precision NOT NULL,
    species_id integer,
    owner_id integer,
    CONSTRAINT animals_pkey PRIMARY KEY (id),
    CONSTRAINT owner_id FOREIGN KEY (owner_id)
        REFERENCES "Owners" (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT species_id FOREIGN KEY (species_id)
        REFERENCES "Species" (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS animals
    OWNER to admin;

COMMENT ON TABLE animals
    IS 'A microverse exercise to create an animal table.';

COMMENT ON COLUMN animals.species_id
    IS 'This is a third Microverse Exercise';

COMMENT ON COLUMN animals.owner_id
    IS 'This is a third Microverse Exercise';

COMMENT ON CONSTRAINT owner_id ON animals
    IS 'This is a third Microverse Exercise';
COMMENT ON CONSTRAINT species_id ON animals
    IS 'This is third Microverse Exercise';




-- Table: vets

-- DROP TABLE IF EXISTS vets;

CREATE TABLE IF NOT EXISTS vets
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2000 CACHE 1 ),
    name text COLLATE pg_catalog."default" NOT NULL,
    age integer NOT NULL,
    date_of_graduation date NOT NULL,
    CONSTRAINT vets_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS vets
    OWNER to admin;

COMMENT ON TABLE vets
    IS 'This is the fourth microverse exercise ';

COMMENT ON COLUMN vets.id
    IS 'This is the fourth microverse exercise';




-- Table: specializations

-- DROP TABLE IF EXISTS specializations;

CREATE TABLE IF NOT EXISTS specializations
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2000 CACHE 1 ),
    species_id integer NOT NULL,
    vet_id integer NOT NULL,
    CONSTRAINT specializations_pkey PRIMARY KEY (id),
    CONSTRAINT species_id FOREIGN KEY (species_id)
        REFERENCES "Species" (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT vet_id FOREIGN KEY (vet_id)
        REFERENCES vets (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS specializations
    OWNER to admin;

COMMENT ON TABLE specializations
    IS 'This is the fourth microverse exercise ';

COMMENT ON CONSTRAINT species_id ON specializations
    IS 'This is the fourth microverse exercise';
COMMENT ON CONSTRAINT vet_id ON specializations
    IS 'This is the fourth microverse exercise ';
-- Index: fki_vet_id

-- DROP INDEX IF EXISTS fki_vet_id;

CREATE INDEX IF NOT EXISTS fki_vet_id
    ON specializations USING btree
    (vet_id ASC NULLS LAST)
    TABLESPACE pg_default;



-- Table: visits

-- DROP TABLE IF EXISTS visits;

CREATE TABLE IF NOT EXISTS visits
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2000 CACHE 1 ),
    animal_id integer NOT NULL,
    vet_id integer NOT NULL,
    date_of_visit date NOT NULL,
    CONSTRAINT visits_pkey PRIMARY KEY (id),
    CONSTRAINT animal_id FOREIGN KEY (animal_id)
        REFERENCES animals (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT vet_id FOREIGN KEY (vet_id)
        REFERENCES vets (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS visits
    OWNER to admin;

COMMENT ON TABLE visits
    IS 'This is the fourth microverse exercise ';

COMMENT ON COLUMN visits.id
    IS 'This is the fourth microverse exercise ';

COMMENT ON CONSTRAINT animal_id ON visits
    IS 'This is the fourth microverse exercise ';
COMMENT ON CONSTRAINT vet_id ON visits
    IS 'This is the fourth microverse exercise ';
-- Index: fki_animal_id

-- DROP INDEX IF EXISTS fki_animal_id;

CREATE INDEX IF NOT EXISTS fki_animal_id
    ON visits USING btree
    (animal_id ASC NULLS LAST)
    TABLESPACE pg_default;





--For today's exercise on Performance and data tuning 


-- Table: Owners

-- DROP TABLE IF EXISTS "Owners";

CREATE TABLE IF NOT EXISTS "Owners"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2500010 CACHE 1 ),
    full_name text COLLATE pg_catalog."default" NOT NULL,
    age integer,
    email text COLLATE pg_catalog."default",
    CONSTRAINT "Owners_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "Owners"
    OWNER to admin;

COMMENT ON TABLE "Owners"
    IS 'This is the third exercise from Microverse';
-- Index: owner_email_index

-- DROP INDEX IF EXISTS owner_email_index;

CREATE INDEX IF NOT EXISTS owner_email_index
    ON "Owners" USING btree
    (id ASC NULLS LAST, email COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;



-- Table: visits

-- DROP TABLE IF EXISTS visits;

CREATE TABLE IF NOT EXISTS visits
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 7200000 CACHE 1 ),
    animal_id integer NOT NULL,
    vet_id integer NOT NULL,
    date_of_visit date NOT NULL,
    CONSTRAINT visits_pkey PRIMARY KEY (id),
    CONSTRAINT animal_id FOREIGN KEY (animal_id)
        REFERENCES public.animals (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT vet_id FOREIGN KEY (vet_id)
        REFERENCES vets (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS visits
    OWNER to admin;

COMMENT ON TABLE visits
    IS 'This is the fourth microverse exercise ';

COMMENT ON COLUMN visits.id
    IS 'This is the fourth microverse exercise ';

COMMENT ON CONSTRAINT animal_id ON visits
    IS 'This is the fourth microverse exercise ';
COMMENT ON CONSTRAINT vet_id ON visits
    IS 'This is the fourth microverse exercise ';
-- Index: animal_visits_index

-- DROP INDEX IF EXISTS animal_visits_index;

CREATE INDEX IF NOT EXISTS animal_visits_index
    ON visits USING btree
    (id ASC NULLS LAST, animal_id ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_animal_id

-- DROP INDEX IF EXISTS fki_animal_id;

CREATE INDEX IF NOT EXISTS fki_animal_id
    ON visits USING btree
    (animal_id ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: vet_visits_index

-- DROP INDEX IF EXISTS vet_visits_index;

CREATE INDEX IF NOT EXISTS vet_visits_index
    ON visits USING btree
    (vet_id ASC NULLS LAST)
    TABLESPACE pg_default;