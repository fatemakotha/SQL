-- *** "classicmodels has 8 tables:
-- *** customers, employees, offices, orderdetails, orders, payments, productlines & products
SELECT * FROM customers;

-- From customers remove people whose lastname is not Young. <> means not equal to,
-- and * means select all columns
SELECT * 
FROM customers
WHERE contactLastName <> 'Young';

-- From the table "customers" select the people with USA as country, AND first name with "Julie"
-- and show their firstname, lastname, phone, city & country
SELECT contactFirstName, contactLastName, phone, city, country
FROM customers
WHERE country = 'USA' AND contactFirstName = 'Julie';

-- From the table "customers" select the people with Norway or Sweden as country, 
-- and show their firstname, lastname, city & country
SELECT contactFirstName, contactLastName, city, country
FROM customers
WHERE country = 'Norway' OR country = 'Sweden';

-- Show all columns for customers from the USA with surname Brown
SELECT *
FROM customers
WHERE country = 'USA' AND contactLastName = 'Brown';

-- Show all columns for customers from the USA or UK with surname Brown
SELECT *
FROM customers
WHERE (country = 'USA' OR COUNTRY = 'UK') AND contactLastName = 'Brown';

-- Show all employees who are Sales Rep
SELECT * FROM employees

-- For all employees who are Sales Rep, display their email
SELECT  email
FROM employees
WHERE jobTitle = 'Sales Rep'