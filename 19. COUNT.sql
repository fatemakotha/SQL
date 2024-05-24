--              #################################### COUNT ##################################
-- BOILERPLATE:
SELECT * 
FROM orders;

SELECT * 
FROM orderdetails; 
-- ----------------------------------------------------------------------------------------------------------------------------

-- 1A: COUNT the number of orders from the *orders* table using the 'orderNumber'
SELECT COUNT(orderNumber)
FROM orders; -- ANS: 326

-- 1B: COUNT the number of orders from the *orderdetails* table using the 'orderNumber'
SELECT COUNT(orderNumber)
FROM orderdetails; -- ANS: 2996
-- # We can see that there are 4 instances of orderNumber 10100 thus if we use this table the count is more
-- This is because the *orderdetails* table breaks it down by product
-- thus we see multiple order numbers

-- # We can see that there are 4 instances of orderNumber 10100 thus if we use this table the count is more
-- to fix that:
-- 1C: We actually need to count the 'distinct order number' to get 326 
SELECT COUNT(DISTINCT orderNumber)
FROM orderdetails; -- ANS: 326
-- ----------------------------------------------------------------------------------------------------------------------------

-- 2A: Now, do the same COUNT as 1C, but group by productCode:
SELECT productCode, COUNT(DISTINCT orderNumber)
FROM orderdetails
GROUP BY productCode;

-- 2B: Now name the *COUNT* column as numorders:
SELECT productCode, COUNT(DISTINCT orderNumber) as numorders
FROM orderdetails
GROUP BY productCode;
-- ----------------------------------------------------------------------------------------------------------------------------

