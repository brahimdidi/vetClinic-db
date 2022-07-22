/* Populate database with sample data. */

-- Insert data into animals

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Agumon',DATE '2020-02-3',0,true,10.23);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Gabumon',DATE '2018-11-15',2,true,8);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Pikachu',DATE '2021-01-7',1,false,15.04);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Devimon', DATE '2017-05-12',5,true,11);

 INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES ('Charmander',DATE '2020-02-08',0,false,-11);
 INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES ('Plantmon',DATE '2021-11-15',2,true,-5.7);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Squirtle',DATE '1993-04-02',3,false,-12.13);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Angemon',DATE '2005-06-12',1,true,-45);
 INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES ('Boarmon',DATE '2005-06-07',7,true,20.4);
 INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES ('Blossom',DATE '1998-10-13',3,true,17);
 INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Ditto',DATE '2022-05-14',4,true,22);

-- Insert data into owners

INSERT INTO owners (full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES
('Pokemon'),
('Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE name species_id IS NULL;
 
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon','Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Angemon','Boarmon');


-- Insert data into vets table 

 INSERT INTO vets (name,age,date_of_graduation)
 VALUES ('William Tatcher',45 , DATE '2000-04-23'),
 ('Maisy Smith',26,DATE '2019-01-17'),
 ('Stephanie Mendez',64, DATE '1981-05-04'),
 ('Jack Harkness' , 38, DATE '2008-06-08');

-- Insert data to specializations

 INSERT INTO specializations (vet_id,species_id)
 VALUES (1,1);
                    ^
 INSERT INTO specializations (vet_id,species_id)
 VALUES (3,1),(3,2),(4,2);

-- Insert data into visist

INSERT INTO visits (vet_id,animals_id,date_of_visit)
VALUES (1,1,DATE '2020-05-24'),(3,1,DATE '2020-07-22');
 
INSERT INTO visits (vet_id,animals_id,date_of_visit)
VALUES (2,5,DATE '2020-05-01'),(2,5,DATE '2020-03-08'),(2,5,DATE '2020-05-14');

INSERT INTO visits (vet_id,animals_id,date_of_visit)
VALUES (3,3, DATE '2021-05-04'),(4,9,DATE '2021-02-24');

INSERT INTO visits (vet_id,animals_id,date_of_visit)
VALUES (2,7,DATE '2019-11-21'),(1,7,DATE '2020-08-10'),(2,7,DATE '2021-04-07');

INSERT INTO visits (vet_id,animals_id,date_of_visit)
VALUES (3,10, DATE '2019-09-29');

INSERT INTO visits (vet_id,animals_id,date_of_visit)
VALUES (4,8, DATE '2020-10-03'),(4,8, DATE '2020-11-04');

INSERT INTO visits (vet_id,animals_id,date_of_visit)
VALUES (3,4, DATE '2019-01-24'),(3,4, DATE '2019-05-15'),(3,4, DATE '2020-02-27'),(3,4, DATE '2020-08-03');

INSERT INTO visits (vet_id,animals_id,date_of_visit)
VALUES (3,6, DATE '2020-05-24'), (1,6, DATE '2021-01-11');