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

--Queries For many to many table 
SELECT animals.name , vets.name , visits.date_of_visit FROM vets
JOIN visits ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT( DISTINCT animals.name) FROM vets
JOIN visits ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name , species.name FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON species.id = specializations.species_id;

SELECT animals.name, visits.date_of_visit, vets.name FROM vets
JOIN visits ON vets.id = visits.vet_id
JOIN animals ON visits.animals_id = animals.id
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name , COUNT(animals.id) AS "count"  FROM visits 
JOIN animals ON visits.animals_id = animals.id 
GROUP BY animals.name ORDER BY count DESC LIMIT 1;

SELECT animals.name , visits.date_of_visit FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit LIMIT 1;

SELECT * FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vet_id
ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(*) FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vet_id
JOIN specializations ON specializations.vet_id = vets.id
WHERE specializations.species_id != animals.species_id;

SELECT animals.species_id, COUNT(animals.species_id) AS "count"  FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith' GROUP BY animals.species_id ORDER BY count DESC LIMIT 1; 

SELECT species.name FROM species WHERE species.id = 1;


