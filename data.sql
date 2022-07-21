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


 
 
