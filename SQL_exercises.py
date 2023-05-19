# Exercises Here: https://www.w3schools.com/sql/sql_exercises.asp

#----------- SQL Select -------------
# Insert the missing statement to get all the columns from the Customers table.
SELECT * FROM Customers;

# Write a statement that will select the City column from the Customers table.
SELECT City FROM Customers;

# Select all the different values from the Country column in the Customers table.
SELECT DISTINCT Country FROM Customers;

#----------- SQL WHERE -------------
# Select all records where the City column has the value "Berlin".
SELECT * FROM Customers
WHERE City = 'Berlin'

# Use the NOT keyword to select all records where City is NOT "Berlin".
SELECT * FROM Customers
WHERE NOT City = 'Berlin'

# Select all records where the CustomerID column has the value 32.
SELECT * FROM Customers
WHERE CustomerID = 32;

# Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 12209.
SELECT * FROM Customers
WHERE City = 'Berlin'
AND PostalCode = 12209;

# Select all records where the City column has the value 'Berlin' or 'London'
SELECT * FROM Customers
WHERE City = 'Berlin'
OR City = 'London';
