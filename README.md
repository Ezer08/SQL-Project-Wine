🍇 Wine Production and Harvest Management Database 🍷


This project is a relational database system designed to manage wine production, harvests, and producer information. It provides a structured approach to storing and querying data related to wine categories, producers, and harvests.

📂 Project Structure


Tables

wine: Stores information about different wine types and their characteristics. 🍾

NumW: Wine Number (Primary Key)
Category: Type of wine (e.g., Red, White, Rose)
Year: Year of production
Degree: Alcohol degree of the wine
producer: Stores information about wine producers. 👩‍🌾👨‍🌾

NumP: Producer Number (Primary Key)
FirstName: Producer's first name
LastName: Producer's last name
Region: Region where the producer is located
harvest: Stores harvest details, linking wines to producers and specifying quantities harvested. 🌾

NumW: Wine Number (Foreign Key)
NumP: Producer Number (Foreign Key)
Quantity: Quantity of wine harvested


📊 Key Queries


Data Insertion

Add wine data to the wine table, including details like category, year, and degree.
Insert producer data into the producer table, detailing the producer's name and region.
Populate the harvest table with harvest quantities for each wine and producer combination.

Data Retrieval

List Producers: Retrieve a list of producers and their regions.
Producers Sorted by Name: Display producers in alphabetical order by last name, followed by first name.
Producers in a Specific Region: Query producers located in specific regions such as Sousse.
Total Harvest Quantity: Calculate the total quantity of wine harvested for a specific wine.
Wine Quantity by Category: Group wine production by category (e.g., Red, White, Rose) and sum the harvest quantities.
Producers with Large Harvests: Find producers in certain regions who have harvested more than 300 liters of wine.
Advanced Queries
Wines with Higher Alcohol Content: List wines with an alcohol degree greater than 12 and produced by specific producers.


🛠️ Requirements


Database Management System (DBMS): This project can be run on any relational DBMS such as MySQL or PostgreSQL.
SQL Knowledge: A basic understanding of SQL, including operations like JOIN, INSERT, SELECT, and GROUP BY.


🚀 Setup Instructions


Clone this repository to your local machine.
Set up your DBMS and create a new database.
Execute the SQL commands to create tables and populate them with sample data.
Run the provided queries to retrieve relevant data.
