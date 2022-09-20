-- Table: patients

-- DROP TABLE IF EXISTS patients;

CREATE TABLE IF NOT EXISTS patients
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 100 CACHE 1 ),
    name text COLLATE pg_catalog."default",
    date_of_birth date,
    CONSTRAINT patients_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS patients
    OWNER to admin;

COMMENT ON TABLE patients
    IS 'This is the day 2 exercise by Microverse ';

COMMENT ON COLUMN patients.id
    IS 'This is the day 2 exercise by Microverse ';




-- Table: medical_histories

-- DROP TABLE IF EXISTS medical_histories;

CREATE TABLE IF NOT EXISTS medical_histories
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 100 CACHE 1 ),
    admitted_at timestamp without time zone,
    patient_id integer NOT NULL,
    status text COLLATE pg_catalog."default",
    CONSTRAINT pk_history_id PRIMARY KEY (id),
    CONSTRAINT medical_patient_fk FOREIGN KEY (patient_id)
        REFERENCES patients (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS medical_histories
    OWNER to admin;

COMMENT ON TABLE medical_histories
    IS 'This is the day 2 exercise by Microverse ';

COMMENT ON CONSTRAINT medical_patient_fk ON medical_histories
    IS 'This is the day 2 exercise of Microverse ';
-- Index: fki_medical_patient_fk

-- DROP INDEX IF EXISTS fki_medical_patient_fk;

CREATE INDEX IF NOT EXISTS fki_medical_patient_fk
    ON medical_histories USING btree
    (patient_id ASC NULLS LAST)
    TABLESPACE pg_default;



-- Table: treatments

-- DROP TABLE IF EXISTS treatments;

CREATE TABLE IF NOT EXISTS treatments
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 100 CACHE 1 ),
    type text COLLATE pg_catalog."default",
    name text COLLATE pg_catalog."default",
    CONSTRAINT treatments_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS treatments
    OWNER to admin;

COMMENT ON TABLE treatments
    IS 'This is the day 2 exercise of Microverse ';





-- Table: invoices

-- DROP TABLE IF EXISTS invoices;

CREATE TABLE IF NOT EXISTS invoices
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 100 CACHE 1 ),
    total_amount double precision,
    generated_at timestamp without time zone,
    payed_at timestamp without time zone,
    medical_history_id integer NOT NULL,
    CONSTRAINT invoices_pkey PRIMARY KEY (id),
    CONSTRAINT fk_history_invoice FOREIGN KEY (medical_history_id)
        REFERENCES medical_histories (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS invoices
    OWNER to admin;

COMMENT ON TABLE invoices
    IS 'This is the day 2 exercise of Microverse ';
-- Index: fki_history_invoice

-- DROP INDEX IF EXISTS fki_history_invoice;

CREATE INDEX IF NOT EXISTS fki_history_invoice
    ON invoices USING btree
    (medical_history_id ASC NULLS LAST)
    TABLESPACE pg_default;




-- Table: invoice_items

-- DROP TABLE IF EXISTS invoice_items;

CREATE TABLE IF NOT EXISTS invoice_items
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 100 CACHE 1 ),
    unit_price double precision,
    quantity integer,
    total_price double precision,
    invoice_id integer NOT NULL,
    treatment_id integer NOT NULL,
    CONSTRAINT invoice_items_pkey PRIMARY KEY (id),
    CONSTRAINT fk_items_invoice FOREIGN KEY (invoice_id)
        REFERENCES invoices (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_items_treatments FOREIGN KEY (treatment_id)
        REFERENCES treatments (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS invoice_items
    OWNER to admin;

COMMENT ON TABLE invoice_items
    IS 'This is the day 2 exercise of Microverse ';
-- Index: fki_fk_items_invoice

-- DROP INDEX IF EXISTS fki_fk_items_invoice;

CREATE INDEX IF NOT EXISTS fki_fk_items_invoice
    ON invoice_items USING btree
    (invoice_id ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_fk_items_treatments

-- DROP INDEX IF EXISTS fki_fk_items_treatments;

CREATE INDEX IF NOT EXISTS fki_fk_items_treatments
    ON invoice_items USING btree
    (treatment_id ASC NULLS LAST)
    TABLESPACE pg_default;



-- Table: treatment_history

-- DROP TABLE IF EXISTS treatment_history;

CREATE TABLE IF NOT EXISTS treatment_history
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 100 CACHE 1 ),
    medical_history_id integer NOT NULL,
    treatment_id integer NOT NULL,
    CONSTRAINT treatment_history_pkey PRIMARY KEY (id),
    CONSTRAINT fk_history FOREIGN KEY (medical_history_id)
        REFERENCES medical_histories (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_treatment FOREIGN KEY (treatment_id)
        REFERENCES treatments (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS treatment_history
    OWNER to admin;

COMMENT ON TABLE treatment_history
    IS 'This is the day 2 exercise of Microverse ';
-- Index: fki_h

-- DROP INDEX IF EXISTS fki_h;

CREATE INDEX IF NOT EXISTS fki_h
    ON public.treatment_history USING btree
    (medical_history_id ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_t

-- DROP INDEX IF EXISTS fki_t;

CREATE INDEX IF NOT EXISTS fki_t
    ON treatment_history USING btree
    (treatment_id ASC NULLS LAST)
    TABLESPACE pg_default;