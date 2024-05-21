-- ######################## UNION ######################
-- UNION combines the tables set of 2 or more select with NO DUPLICATES**
-- RULES:
-- Each result set must have the same column
--  The columns must be in the same order
-- EXAMPLE CODE:
-- SELECT
-- contactFirstName, contactLastName
-- FROM classicmodels.customers
-- union
-- firstName as contactFirstName,
-- lastName as contactLastName
-- FROM classicmodels.employees
-- -----------------------------------------------------------Boilerplate code------------------------------------------------------------------------

SELECT *
FROM customers;

SELECT *
FROM employees;
-- -------------------------------------------------------UNION example 1--------------------------------------------------------------------------------------

SELECT contactFirstName as firstname,
contactLastName as lastname
FROM customers

UNION

select firstname, 
lastname
from employees;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------

-- --------------------------------------------UNION example  from QUIZ "WON'T RUN IN THIS FILE"*** -----------------------------------------
-- QUESTION: 
-- Show all Employees and Customers
-- Two tables called customer and employee have been created with the following columns:
-- Customer: with columns: customerid, firstname, lastname and country
-- Employee:
--  with columns: employeeid, firstname, lastname, country
-- Show the firstname, lastname and country of all customers and employees in the same output, and do not include duplicates:
--                                          ---- START CODE: ------
-- select firstname as firstname,
-- lastname as lastname,
-- country as country
-- from 
-- customer

-- UNION

-- select firstname, lastname, country
-- from 
-- employee;
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------



-- -------------------------------------------------------UNION example 3 *** --------------------------------------------------------------------------------------
-- Lets say that we want to add the *city* column from the CUSTOMER'S table. But there is no *city* column in the EMPLOYEE'S table
-- Then we do this:
SELECT 'customer' as type, -- *type* is the name of the new column
contactFirstName as firstname,
contactLastName as lastname,
city
FROM customers

UNION 

SELECT
'employee' as type, -- *type* is the name of the new column
firstname, 
lastname,
'Unknown' as city
from employees;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------


-- ######################## UNION ALL######################
-- UNION ALL combines the result set of 2 or more select with DUPLICATES**
-- we can also add a NEW column to seperate EMPLOYEES and CUSTOMERS
-- EXAMPLE CODE:
-- SELECT
-- 'customer' as type,
-- contactFirstName,
-- contactLastName
-- FROM classicmodels.customers
-- union
-- SELECT
-- 'employee' as type,
-- firstName as contactFirstName,
-- lastName as contactLastName
-- FROM classicmodels.employees


SELECT 'customer' as type, -- *type* is the name of the new column
contactFirstName as firstname,
contactLastName as lastname
FROM customers

UNION ALL

SELECT
'employee' as type, -- *type* is the name of the new column
firstname, 
lastname
from employees