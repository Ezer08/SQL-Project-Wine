CREATE TABLE wine (
    NumW INT PRIMARY KEY,
    Category VARCHAR(50),
    Year INT,
    Degree DECIMAL(3, 1)
);

CREATE TABLE producer (
    NumP INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Region VARCHAR(50)
);

CREATE TABLE harvest (
    NumW INT,
    NumP INT,
    Quantity INT,
    PRIMARY KEY (NumW, NumP),
    FOREIGN KEY (NumW) REFERENCES wine(NumW),
    FOREIGN KEY (NumP) REFERENCES producer(NumP)
);
--Inserting data into the wine table:
INSERT INTO wine (NumW, Category, Year, Degree) VALUES
(1, 'Red', 2020, 13.5),
(2, 'White', 2019, 12.0),
(3, 'Rose', 2021, 11.5);
--Inserting data into the producer table:
INSERT INTO producer (NumP, FirstName, LastName, Region) VALUES
(1, 'John', 'Doe', 'Napa Valley'),
(2, 'Jane', 'Smith', 'Bordeaux'),
(3, 'Emily', 'Johnson', 'Tuscany');
--Inserting data into the harvest table:
INSERT INTO harvest (NumW, NumP, Quantity) VALUES
(1, 1, 500),
(2, 2, 300),
(3, 3, 200),
(1, 2, 150),
(2, 3, 250);
--Give the list the producers.
SELECT FirstName, LastName, Region
FROM producer;
--Give the list of producers sorted by name.

SELECT FirstName, LastName, Region
FROM producer
ORDER BY LastName, FirstName;
--Give the list the producers of Sousse.
INSERT INTO producer (NumP, FirstName, LastName, Region) VALUES
(4, 'Mohamed', 'Ali', 'Sousse'),
(5, 'Fatima', 'Ahmed', 'Sousse'),
(6, 'Youssef', 'Khalil', 'Sousse');

SELECT FirstName, LastName, Region
FROM producer
WHERE Region = 'Sousse';
--Calculate the total quantity of wine produced having the number 12.
INSERT INTO wine (NumW, Category, Year, Degree) VALUES
(4, 'Red', 2018, 14.0),
(5, 'White', 2022, 12.5),
(6, 'Red', 2017, 13.0),
(7, 'Rose', 2020, 11.0),
(8, 'White', 2016, 11.8),
(9, 'Red', 2019, 13.2),
(10, 'Rose', 2018, 12.3),
(11, 'Red', 2023, 13.8),
(12, 'White', 2015, 11.0),
(13, 'Red', 2022, 14.2),
(14, 'Rose', 2017, 11.8),
(15, 'White', 2021, 12.3);


-- Adding harvest records for wine number 12
INSERT INTO harvest (NumW, NumP, Quantity) VALUES
(12, 1, 200),
(12, 2, 300),
(12, 3, 150);

SELECT SUM(Quantity) AS TotalQuantity
FROM harvest
WHERE NumW = 12;

-- Inserting data into the harvest table for the new producers
INSERT INTO harvest (NumW, NumP, Quantity) VALUES
(1, 4, 400),
(2, 5, 250),
(3, 6, 150),
(1, 5, 200),
(2, 6, 300);

--Calculate the quantity of wine produced by category.

SELECT w.Category, SUM(h.Quantity) AS TotalQuantity
FROM wine w
JOIN harvest h ON w.NumW = h.NumW
GROUP BY w.Category;

--Which producers in the Sousse region have harvested at least one wine in quantities greater than 300 liters? We want the names and first names of the producers, sorted in alphabetical order.
select * from producer
select * from harvest
select * from wine

SELECT p.FirstName, p.LastName
FROM producer p
JOIN harvest h ON p.NumP = h.NumP
JOIN wine w ON h.NumW = w.NumW
WHERE p.Region = 'Sousse'
AND h.Quantity > 300
AND (w.Category = 'Red' OR w.Category = 'White' OR w.Category = 'Rose')
ORDER BY p.LastName, p.FirstName;

--List the wine numbers that have a degree greater than 12 and that have been produced by producer number 24.
INSERT INTO producer (NumP, FirstName, LastName, Region) VALUES
(7, 'Alejandro', 'García', 'Mexico City'),
(8, 'Fernanda', 'Silva', 'Brasília'),
(9, 'Juan', 'Martinez', 'Buenos Aires'),
(10, 'Giuseppe', 'Russo', 'Rome'),
(11, 'Sophie', 'Lefèvre', 'Paris'),
(12, 'Pablo', 'Fernández', 'Mexico City'),
(13, 'Ana', 'Rodriguez', 'Buenos Aires'),
(14, 'Rafael', 'Santos', 'Brasília'),
(15, 'Giovanni', 'Conti', 'Rome'),
(16, 'Étienne', 'Dubois', 'Paris'),
(17, 'Elena', 'Hernández', 'Mexico City'),
(18, 'Diego', 'Moreno', 'Buenos Aires'),
(19, 'Camila', 'Oliveira', 'Brasília'),
(20, 'Luca', 'Rossi', 'Rome'),
(21, 'Claire', 'Girard', 'Paris'),
(22, 'Luis', 'González', 'Mexico City'),
(23, 'Marcela', 'Lima', 'Brasília'),
(24, 'Sofia', 'Costa', 'Buenos Aires'),
(25, 'Mario', 'Bianchi', 'Rome'),
(26, 'Alexandre', 'Dupont', 'Paris'),
(27, 'Roberto', 'Vargas', 'Mexico City'),
(28, 'Luciana', 'Santos', 'Brasília'),
(29, 'Joaquín', 'Alvarez', 'Buenos Aires'),
(30, 'Luigi', 'Ferrari', 'Rome');


-- Adding harvest records for producer 24
INSERT INTO harvest (NumW, NumP, Quantity) VALUES
(1, 24, 200),
(2, 24, 300),
(3, 24, 150);

--List the wine numbers that have a degree greater than 12 and that have been produced by producer number 24.
SELECT DISTINCT h.NumW
FROM harvest h
JOIN wine w ON h.NumW = w.NumW
WHERE w.Degree > 12
AND h.NumP = 24;

