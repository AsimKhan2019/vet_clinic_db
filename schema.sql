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