-- Database: vet_clinic

-- DROP DATABASE IF EXISTS vet_clinic;

CREATE DATABASE vet_clinic
    WITH
    OWNER = admin
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE vet_clinic
    IS 'Vet Clinic is a Microverse exercise to demonstrate that students can create database and their relvant tables';
