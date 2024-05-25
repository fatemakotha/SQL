-- BOILERPLATE:
-- ---EXAMPLE CODE:---
-- SELECT *
-- FROM
-- (SELECT column1, column2, etc
-- FROM table1) t1

SELECT *
FROM orders;
-- ---------------------------------------------------------------------------------------------------------
-- QUESTION 1A:
SELECT orderDate, COUNT(orderNumber) AS orders -- counts the no of orders, and shows the 'orderDate' & 'no of orders"
FROM orders
GROUP BY orderDate;
#OUTPUT:
-- orderDate, orders
-- '2003-01-06', '1'
-- '2003-01-09', '1'
-- . . . . . . . . .

-- QUESTION 1B:
-- we select all entries from 1A
SELECT * 
FROM
-- the code in () below counts the no of orders, and shows the 'orderDate' & 'no of orders"
(SELECT orderDate, COUNT(orderNumber) AS orders
FROM orders
GROUP BY orderDate) AS T1; -- and we now group them by 'orderDate' and name that table as T1
#OUTPUT:
-- orderDate, orders
-- '2003-01-06', '1'
-- '2003-01-09', '1'
-- . . . . . . . . .

-- QUESTION 1C:
 -- we select AVERAGE of all 'orders'  from 1A
SELECT AVG(orders)
FROM
(SELECT orderDate, COUNT(orderNumber) AS orders
FROM orders
GROUP BY orderDate) AS T1; -- and we now group them by 'orderDate' and name that table as T1
#OUTPUT:
-- AVG(orders)
-- '1.2302'

-- QUESTION 1D:
-- we select AVERAGE of all 'orders'  from 1A that were were after '2005-05-01'
SELECT AVG(orders) 
FROM
(SELECT orderDate, COUNT(orderNumber) AS orders
FROM orders
GROUP BY orderDate) AS T1
WHERE orderDate > '2005-05-01' -- and we now group them by 'orderDate' and name that table as T1 and see which entries were after '2005-05-01'
#OUTPUT:
-- AVG(orders)
-- '1.2727'

