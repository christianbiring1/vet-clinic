/*Queries that provide answers to the questions from all projects.*/
SELECT name from vet_clinicschema.animals WHERE right (name, 3) = 'mon';
SELECT name from vet_clinicschema.animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from vet_clinicschema.animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth from vet_clinicschema.animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts from vet_clinicschema.animals WHERE weight_kg > 10.5;
SELECT * from vet_clinicschema.animals WHERE neutered = TRUE;
SELECT * from vet_clinicschema.animals WHERE name != 'Gabumon';
SELECT * from vet_clinicschema.animals WHERE 10.4 <= weight_kg AND weight_kg >= 17.3;
