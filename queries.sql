/*Queries that provide answers to the questions from all projects.*/
SELECT name from animals where date_of_birth between '2016-01-01' and '2019-12-31';
SELECT name from animals WHERE right (name, 3) = 'mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = TRUE;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE 10.4 <= weight_kg AND weight_kg >= 17.3;

BEGIN;
ALTER TABLE animals RENAME COLUMN species TO unspecified;
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE RIGHT (name, 3) = 'mon';
SELECT * FROM animals;
UPDATE animals SET species = 'pokemon' WHERE RIGHT (name, 3) != 'mon';
COMMIT;
SELECT * FROM animals;


BEGIN
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;


BEGIN;
DELETE FROM animals WHERE date_of_birth::date > '2022-01-01';
SAVEPOINT update1;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO update1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;


-- How many animals are there?
SELECT COUNT (name) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT (name) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG (weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT MAX (escape_attempts) FROM animals;
SELECT name FROM animals WHERE escape_attempts >= 7;
SELECT name FROM animals WHERE neutered = TRUE;
SELECT name FROM animals WHERE neutered = FALSE;

-- What is the minimum and maximum weight of each type of animal?
SELECT MIN (weight_kg) FROM animals WHERE species = 'pokemon';
SELECT MAX (weight_kg) FROM animals WHERE species = 'pokemon';
SELECT MIN (weight_kg) FROM animals WHERE species = 'digimon';
SELECT MAX (weight_kg) FROM animals WHERE species = 'digimon';

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT AVG (escape_attempts) FROM animals WHERE species = 'digimon' AND date_of_birth between '1990-01-01' AND '2000-12-31';
SELECT AVG (escape_attempts) FROM animals WHERE species = 'pokemon' AND date_of_birth between '1990-01-01' AND '2000-12-31';

-- What animals belong to Melody Pond?
SELECT name FROM animals
JOIN owners
ON animals.owner_id = owners.id 
WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals
JOIN species
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name FROM owners
LEFT JOIN animals
ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT species.name, COUNT(animals.species_id) FROM animals
JOIN species
ON animals.species_id = species.id
GROUP BY species.id;

-- List all Digimon owned by Jennifer Orwell.
SELECT owners.full_name, animals.name FROM owners
JOIN animals
ON owners.id = animals.owner_id
WHERE owners.full_name = 'Jennifer Orwell'
AND animals.species_id = 2;

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT owners.full_name, animals.name, animals.escape_attempts FROM owners JOIN animals
ON owners.id = animals.owner_id
WHERE owners.full_name = 'Dean Winchester'
AND animals.escape_attempts = 0

-- Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) FROM owners
LEFT JOIN animals
ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY COUNT(vet_clinic.animals.name) DESC LIMIT 1;