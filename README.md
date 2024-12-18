🍇 Wine Production and Harvest Management Database 🍷
This project is a relational database system for managing wine production, harvests, and producer information. It includes several SQL queries for inserting, retrieving, and processing data related to wine categories, producers, and harvests.

📂 Project Structure
Tables
wine: Stores information about different wine types and their characteristics. 🍾

NumW (INT): Wine Number (Primary Key)
Category (VARCHAR(50)): Type of wine (e.g., Red, White, Rose)
Year (INT): Year of production
Degree (DECIMAL(3, 1)): Alcohol degree of the wine
producer: Stores information about wine producers. 👩‍🌾👨‍🌾

NumP (INT): Producer Number (Primary Key)
FirstName (VARCHAR(50)): Producer's first name
LastName (VARCHAR(50)): Producer's last name
Region (VARCHAR(50)): Region where the producer is located
harvest: Stores harvest details, linking wines to producers and specifying quantities harvested. 🌾

NumW (INT): Wine Number (Foreign Key)
NumP (INT): Producer Number (Foreign Key)
Quantity (INT): Quantity of wine harvested
Sample Data Insertion
The following data is inserted into the tables for testing and demonstration purposes:

Wine: Various types of wines with their categories, years, and alcohol degrees.
Producer: Multiple producers located in different regions.
Harvest: Harvest quantities for each producer and wine combination.
SQL Queries
1. Inserting Data
Inserting Wines: Adds several wine entries into the wine table. 🍷
sql
Copier le code
-- Inserting data into the wine table:
INSERT INTO wine (NumW, Category, Year, Degree) VALUES
(1, 'Red', 2020, 13.5),
(2, 'White', 2019, 12.0),
(3, 'Rose', 2021, 11.5);
Inserting Producers: Adds several producers into the producer table. 🌿
sql
Copier le code
-- Inserting data into the producer table:
INSERT INTO producer (NumP, FirstName, LastName, Region) VALUES
(1, 'John', 'Doe', 'Napa Valley'),
(2, 'Jane', 'Smith', 'Bordeaux'),
(3, 'Emily', 'Johnson', 'Tuscany');
Inserting Harvests: Adds harvest data for wines and producers into the harvest table. 🚜
sql
Copier le code
-- Inserting data into the harvest table:
INSERT INTO harvest (NumW, NumP, Quantity) VALUES
(1, 1, 500),
(2, 2, 300),
(3, 3, 200),
(1, 2, 150),
(2, 3, 250);
2. Querying Data
List Producers: Displays a list of producers. 📜
sql
Copier le code
SELECT FirstName, LastName, Region
FROM producer;
Producers Sorted by Name: Displays producers sorted by last name, then by first name. 🔤
sql
Copier le code
SELECT FirstName, LastName, Region
FROM producer
ORDER BY LastName, FirstName;
Producers in Sousse: Retrieves producers located in the region "Sousse". 📍
sql
Copier le code
SELECT FirstName, LastName, Region
FROM producer
WHERE Region = 'Sousse';
Total Quantity of Wine Produced for a Specific Wine: Calculates the total quantity of wine produced for a specific wine number. 💡
sql
Copier le code
SELECT SUM(Quantity) AS TotalQuantity
FROM harvest
WHERE NumW = 12;
3. Aggregated Queries
Total Quantity by Wine Category: Calculates the total quantity of wine produced by each wine category (Red, White, Rose). 🍷
sql
Copier le code
SELECT w.Category, SUM(h.Quantity) AS TotalQuantity
FROM wine w
JOIN harvest h ON w.NumW = h.NumW
GROUP BY w.Category;
Producers from Sousse with Harvest Quantities Greater than 300 Liters: Retrieves producers in the Sousse region who have harvested at least one wine in quantities greater than 300 liters. 🏆
sql
Copier le code
SELECT p.FirstName, p.LastName
FROM producer p
JOIN harvest h ON p.NumP = h.NumP
JOIN wine w ON h.NumW = w.NumW
WHERE p.Region = 'Sousse'
AND h.Quantity > 300
AND (w.Category = 'Red' OR w.Category = 'White' OR w.Category = 'Rose')
ORDER BY p.LastName, p.FirstName;
Wines with Degree Greater than 12 by Producer 24: Lists wine numbers produced by producer number 24 that have an alcohol degree greater than 12. 📊
sql
Copier le code
SELECT DISTINCT h.NumW
FROM harvest h
JOIN wine w ON h.NumW = w.NumW
WHERE w.Degree > 12
AND h.NumP = 24;
🛠️ Requirements
Database Management System (DBMS): This project uses a relational DBMS such as MySQL or PostgreSQL to execute the SQL queries.
SQL Knowledge: Basic to intermediate understanding of SQL, including JOIN, INSERT, SELECT, and GROUP BY operations.
🚀 Setup Instructions
Clone this repository to your local machine.
Set up your DBMS and create a new database.
Copy and paste the SQL queries from setup.sql to create the required tables.
Execute the insert commands to populate the tables with sample data.
Run the provided SELECT queries to retrieve the desired information.
