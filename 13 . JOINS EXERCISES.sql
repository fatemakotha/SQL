-- # Remember, INNER JOIN is for MATCHING COLUMNS, LEFT/RIGHT JOIN is with NON MATHCING COLUMNS or will NULL

SELECT *
FROM customers; -- B
SELECT *
FROM orders; -- A



-- ## TASK 1: 
-- 1) Show the customer first name, lastname, orderdate and status 
-- for each order in the *orders* table(T1)with a 'matching' customer in the customer table.
-- ANSWER: INNER JOIN **
-- SO HERE THE *orders* table is the forst table T1/A
SELECT B.contactFirstName, B.contactLastName, A.orderDate, A.status
FROM orders A
INNER JOIN customers B
ON A.customerNumber = B.customerNumber;
-- ------------------------------------------------------------------------------------------------------------------------

-- ## TASK 2:
-- Display the *first name* and *last name* of all customers, and the *order date* 
-- and *ordernumber* of all their orders, 
-- EVEN IF THE CUSTOMER MADE NO ORDERS.
-- SO HERE THE *customers* table is the first table T1/A
SELECT A.contactFirstName, A.contactLastName, B.orderDate, B.orderNumber
FROM customers A
LEFT JOIN orders B
ON A.customerNumber = B.customerNumber;
-- RESULT: We found some NULL values
-- ------------------------------------------------------------------------------------------------------------------------

-- Now we ONLY want to see output of JUST THE NULL VALUES
SELECT A.contactFirstName, A.contactLastName, B.orderDate, B.orderNumber
FROM customers A
LEFT JOIN orders B
ON A.customerNumber = B.customerNumber
WHERE B.orderDate is null; -- we can use the *orderDate* or the *orderNumber*
-- #RESULT: We only see customers with NULL values
-- ------------------------------------------------------------------------------------------------------------------------
-- ## TASK 2:
-- Display the *first name* and *last name* of all customers, and the *order date* 
-- and *ordernumber* of all their orders, 
-- ONLY IF THE CUSTOMER HAS MADE ANY ORDERS.
-- SO HERE THE *customers* table is the first table T1/A
SELECT A.contactFirstName, A.contactLastName, B.orderDate, B.orderNumber
FROM customers A
LEFT JOIN orders B
ON A.customerNumber = B.customerNumber
WHERE B.orderDate is not null -- we can use the *orderDate* or the *orderNumber*






-- ------------------------------------------------------------------------------------------------------------------------