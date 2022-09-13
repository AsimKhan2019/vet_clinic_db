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
