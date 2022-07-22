/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
id INT,
name VARCHAR(50),
date_of_birth DATE,
escape_attempts INT,
neutered BOOL,
weight_kg DECIMAL,
);

ALTER TABLE animals ADD species varchar(50);


 CREATE TABLE owners(
id BIGSERIAL NOT NULL PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
age INT
);

 CREATE TABLE species (
 id BIGSERIAL NOT NULL PRIMARY KEY,
 name VARCHAR(100)
 );
 
ALTER TABLE animals
DROP COLUMN id;
ALTER TABLE animals
ADD COLUMN id BIGSERIAL NOT NULL PRIMARY KEY;

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id BIGINT REFERENCES species (id);

ALTER TABLE animals
ADD COLUMN owner_id BIGINT REFERENCES owners (id);

 CREATE TABLE vets(
 id BIGSERIAL NOT NULL PRIMARY KEY,
 name VARCHAR(100),
 age INT,
 date_of_graduation DATE
 );

CREATE TABLE specializations (
 vet_id BIGINT REFERENCES vets (id),
 species_id BIGINT REFERENCES species (id)
 );

 CREATE TABLE visits (
 vet_id BIGINT REFERENCES vets (id),
 animals_id BIGINT REFERENCES animals (id),
 date_of_visit  DATE
 );