-- #############  EXAMPLE AND USE CASE OF JOINS ###########
-- The PRIMARY KEY in the *customers* table is *customerNumber*
-- The PRIMARY KEY in the *payments* table is also *customerNumber*
-- Thus we can match these two tables and join them using the PRIMARY KEY
-- -----------------------------------------------------------------------------------------------------------

-- *customers table*
SELECT * FROM classicmodels.customers;
-- *payments table*
SELECT * FROM classicmodels.payments;
-- -----------------------------------------------------------------------------------------------------------

-- With INNER JOIN, we want to see EVERYTHING about customers who made payments: ***
SELECT * FROM classicmodels.customers A -- lets name this table A instead of T1
INNER JOIN classicmodels.payments B -- lets name this table A instead of T2
-- We join them based on the PRIMARY KEY which is the same for both the tables:
ON A.customerNumber = B.customerNumber;
-- Till this point you will get duplicates as they have made multiple payments
-- -----------------------------------------------------------------------------------------------------------

-- Now ith INNER JOIN, we want to see the 
-- *customerName* from A
-- *amount* from B
-- *paymentDate* from B
-- about customers who made payments: ***
SELECT A.customerName, B.amount, B.paymentDate
FROM classicmodels.customers A -- lets name this table A instead of T1
INNER JOIN classicmodels.payments B -- lets name this table A instead of T2
-- We join them based on the PRIMARY KEY which is the same for both the tables:
ON A.customerNumber = B.customerNumber;
-- RESULT:
-- Till this point you will get duplicates a;s they have made multiple payments
-- so even though *'Atelier graphique'* appears only once as *customerName* in A, 
-- it is showing 3 thrice as they made 3 payments
-- And since its an INNER JOIN it is only showing matching customers when they made payments
-- show no NULL values
-- -----------------------------------------------------------------------------------------------------------

-- Now we want to see 
-- *customerName* from A
-- *amount* from B
-- *paymentDate* from B
-- who DID NOT MAKE any payments as NULL: ***
-- We can do that with a LEFT JOIN***
SELECT A.customerName, B.amount, B.paymentDate
FROM classicmodels.customers A -- lets name this table A instead of T1
LEFT JOIN classicmodels.payments B -- lets name this table A instead of T2
-- We join them based on the PRIMARY KEY which is the same for both the tables:
ON A.customerNumber = B.customerNumber;
-- RESULT:
-- Now we can see everything from the customers table even if they made sero payments
-- which is why if we scroll down we see NULL values
-- -----------------------------------------------------------------------------------------------------------

-- Now we want to see ONLY the 
-- *customerName* from A
-- *amount* from B
-- *paymentDate* from B
-- who DID NOT MAKE any payments: ***
SELECT A.customerName, B.amount, B.paymentDate
FROM classicmodels.customers A 
LEFT JOIN classicmodels.payments B
ON A.customerNumber = B.customerNumber
WHERE B.amount is null
-- RESULT
-- Now it is showing the info on customers who haven't made any payments, so basically all NULL values. **
-- And we will see each *customerName* once in this because there are no payments **