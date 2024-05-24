-- #                                                BOILERPLATE:
SELECT *
FROM orders;

SELECT *
FROM customers;

SELECT *
FROM orderdetails;
-- ---------------------------------------------------------------------------------------------------------

-- QUESTION 1: Show the customer name of the company which made the most amount of orders:
SELECT *
FROM orders T1
INNER JOIN customers T2
ON T1.customerNumber = T2.customerNumber;
-- OUTPUT: All the customer names will be on the right and will appear multiple times because of multiple orders by each customer
-- So ANSWER to 1 is :

SELECT customerName, COUNT(orderNumber) as orders -- REMEMBER 'oderNumber is the NUMBER OF ORDERS, not an order token number *****
FROM orders T1
INNER JOIN customers T2
ON T1.customerNumber = T2.customerNumber -- it won't run so we need to GROUP BY:
GROUP BY customerName;
-- OUTPUT: Shows how many orders each cutomer had
--  customerName, orders
-- 'Atelier graphique', '3'
-- 'Signal Gift Stores', '3'

-- So, to get the name of the company with HIGHEST orders to ANSWER 1, we want to ORDER BY the COUNT(orderNumber):
SELECT customerName, COUNT(orderNumber) as orders -- REMEMBER 'oderNumber is the NUMBER OF ORDERS, not an order token number *****
FROM orders T1
INNER JOIN customers T2
ON T1.customerNumber = T2.customerNumber -- it won't run so we need to GROUP BY:
GROUP BY customerName
ORDER BY orders DESC;
-- OUTPUT: 
-- customerName, orders
-- 'Euro+ Shopping Channel', '26'
-- 'Mini Gifts Distributors Ltd.', '17'
--  . . . . . 

-- And if we ONLY wanted to show thw first row, which is only the customer with HIGHEST orders then 
-- or just see the first row, then:
SELECT customerName, COUNT(orderNumber) as orders -- REMEMBER 'oderNumber is the NUMBER OF ORDERS, not an order token number *****
FROM orders T1
INNER JOIN customers T2
ON T1.customerNumber = T2.customerNumber -- it won't run so we need to GROUP BY:
GROUP BY customerName
ORDER BY orders DESC
limit 1;
-- OUTPUT:
--  customerName, orders
-- 'Euro+ Shopping Channel', '26'


-- ---------------------------------------------------------------------------------------------------------

-- QUESTION 2: Display each customers first and last order date.
SELECT customerName, MIN(orderDate) as firstorderdate, MAX(orderDate) as latestorderdate
FROM orders T1
INNER JOIN customers T2
ON T1.customerNumber = T2.customerNumber
GROUP BY customerName;
-- OUTPUT:
-- customerName, firstorderdate, latestorderdate
-- 'Online Diecast Creations Co.', '2003-01-06', '2004-11-04'
-- 'Blauer See Auto, Co.', '2003-01-09', '2004-11-05'
-- . . . . . . . . 









-- ---------------------------------------------------------------------------------------------------------
-- QUESTION 1: Display each customers first and last order date: