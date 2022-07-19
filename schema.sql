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
