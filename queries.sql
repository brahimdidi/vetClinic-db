/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name,escape_attempts FROM animals WHERE  weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts<1;
SELECT AVG(weight_kg) from animals;
SELECT SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT MIN(weight_kg) FROM animals GROUP BY species;
SELECT AVG(weight_kg) from animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species;

SELECT * FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT owners.full_name , animals.name FROM owners
LEFT JOIN animals ON animals.owner_id = owners.id;

 SELECT species.name, COUNT(*) FROM animals
 JOIN species ON animals.species_id = species.id
 GROUP BY species.name;
 
 SELECT * FROM species
 JOIN owners ON owners.id = species.id
 WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT * FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts < 1;

 SELECT owners.full_name , COUNT(*) FROM animals
 JOIN owners ON animals.owner_id = owners.id
 GROUP BY owners.full_name ORDER BY COUNT(*) DESC LIMIT 1;
