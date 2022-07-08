/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer,
    name varchar(100),
    date_of_birth date,
    escape_attemps integer,
    neutered boolean,
    weight_kg decimal
);

ALTER TABLE vet_clinicschema.animals ADD COLUMN species varchar;
