create database	Countries;
use countries;


-- Table Creation
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(1, 'USA', 331000000, 9833520),
(2, 'China', 1439323776, 9596961),
(3, 'India', 1400000000, 3287263),
(4, 'Brazil', 214000000, 8515767),
(5, 'Russia', 146000000, 17098242),
(6, 'Australia', 26000000, 7692024),
(7, 'Canada', 38000000, 9984670),
(8, 'Germany', 84000000, 357022),
(9, 'UK', 67000000, 243610),
(10, 'Japan', 126000000, 377975);


INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(1, 'John', 'Doe', 1000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 2000, 3.8, 2, 'China'),
(3, 'Ali', 'Khan', 3000, 4.2, 3, 'India'),
(4, 'Maria', 'Gomez', 2500, 4.7, 4, 'Brazil'),
(5, 'Igor', 'Ivanov', 1500, 3.9, 5, 'Russia'),
(6, 'Emma', 'Brown', 1200, 4.6, 6, 'Australia'),
(7, 'Liam', 'Johnson', 1700, 4.3, 7, 'Canada'),
(8, 'Sophia', 'Müller', 1400, 4.1, 8, 'Germany'),
(9, 'William', 'Davis', 2200, 4.4, 9, 'UK'),
(10, 'Akira', 'Tanaka', 1100, 4.0, 10, 'Japan');


--  Print the first three characters of Country_name
SELECT SUBSTRING(Country_name, 1, 3) AS FirstThreeChars FROM Country;

-- Concatenate Fname and Lname
SELECT CONCAT(Fname, ' ', Lname) AS FullName FROM Persons;

--  Count the number of unique country
SELECT COUNT(DISTINCT Country_name) AS UniqueCountries FROM Persons;

-- maximum population from the Country
SELECT MAX(Population) AS MaxPopulation FROM Country;

-- minimum population from the Persons
SELECT MIN(Population) AS MinPopulation FROM Persons;

-- new rows into Persons with Lname set to NULL and count Lname
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES (11, 'John', NULL, 2000, 4.5, 1, 'USA'),
       (12, 'Jane', NULL, 3000, 3.8, 2, 'UK');

SELECT COUNT(Lname) AS LnameCount FROM Persons;

-- number of rows in the Persons table
SELECT COUNT(*) AS TotalRows FROM Persons;

-- population of the Country table for the first 3 rows
SELECT Population FROM Country LIMIT 3;

-- Print 3 random rows of countries
SELECT * FROM Country ORDER BY RAND() LIMIT 3;

-- all persons ordered by their rating in descending
SELECT * FROM Persons ORDER BY Rating DESC;

-- total population for each country in the Persons table
SELECT Country_name, SUM(Population) AS TotalPopulation
FROM Persons
GROUP BY Country_name;

-- Find countries in the Persons table with a total population greater than 50,000
SELECT Country_name, SUM(Population) AS TotalPopulation
FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;

-- total number of persons and average rating for each country, but only for countries with more than 2 persons
SELECT Country_name, 
COUNT(*) AS TotalPersons, 
AVG(Rating) AS AverageRating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) >= 2
ORDER BY AverageRating ASC;



