

-- Check what is inside the *customers* table
SELECT *
FROM customers; -- has customerName

-- Check what is inside the *employees* table
SELECT *
FROM employees; -- has firstName, lastName

-- -------------------------------------------------------------------------------------------------------------------------

-- #################################################### LEFT JOIN ####################################################
-- *employees* table is table1(T1) and *customers* table is table2(T2)
-- We are LEFT JOINING the *customers* table to the *employees* table
-- based on the *employeenumber* in the *customer* table 
-- but has a different name in the *employee* table called the *salesRepEmployeeNumber*
SELECT 
firstName, -- included in *employees* table
lastName, -- included in *employees* table
customerName -- included in *customers* table
FROM classicmodels.employees T1
LEFT JOIN classicmodels.customers T2
ON T1.employeeNumber = T2.salesRepEmployeeNumber;

-- RESULT:
-- LEFT JOIN: Includes all rows from the left table T1 and the matched rows from the right table T2
-- Rows from the left table T1 with no match in the right table T2 will show NULL for columns from the right table.
-- ALL rows from *employyes* table is included ******
-- The first 6 employees have no customers, thus is displays null
-- we see the lastname and the first name in numerous entries as they have multiple customers
-- -------------------------------------------------------------------------------------------------------------------------


-- The query below gives all the columns from both the *employees* and the *customers table*
SELECT 
*
FROM classicmodels.employees T1
LEFT JOIN classicmodels.customers T2
ON T1.employeeNumber = T2.salesRepEmployeeNumber; 
-- RESULT: Some null values
-- -------------------------------------------------------------------------------------------------------------------------


-- HOW DO WE FIND THESE NULL VALUES?
-- So the way to view all the NULLS by adding a where condition:
SELECT 
*
FROM classicmodels.employees T1
LEFT JOIN classicmodels.customers T2
ON T1.employeeNumber = T2.salesRepEmployeeNumber;
WHERE T2.customeNumber is null;
-- RESULT: This gives all employees who didn't have any customers
-- -------------------------------------------------------------------------------------------------------------------------


-- HOW DO WE FIND THESE NULL VALUES with the job title of *Sales Rep*?
SELECT 
*
FROM CLASSICMODELS.EMPLOYEES T1
LEFT JOIN CLASSICMODELS.CUSTOMERS T2
ON T1.EMPLOYEENUMBER = T2.SALESREPEMPLOYEENUMBER
WHERE T2.customerNumber is null
AND jobTitle = 'Sales Rep';
-- RESULT: This gives the 2 employees who didn't have any customers and have the job title of *Sales Rep*
-- -------------------------------------------------------------------------------------------------------------------------



-- #################################################### RIGHT JOIN ####################################################
-- So now if we look at RIGHT JOIN, it is the opposite of LEFT JOIN
-- It will show all records for the second table(T2) listed and only matching records in table one (T1)
-- EXAMPLE:

SELECT 
firstName, -- included in *employees* table
lastName, -- included in *employees* table
customerName -- included in *customers* table
FROM classicmodels.customers T1
RIGHT JOIN classicmodels.employees T2
ON T1.salesRepEmployeeNumber = T2.employeeNumber;
