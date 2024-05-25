-- Another way of writing SUBQUERIES: Coomon Table Expression(CTE):

-- WITH cte_name AS
-- (SELECT column1, column2 etc
-- FROM table_name)
-- SELECT *
-- FROM cte_name
-- ----------------------------------------------------------------------------------------------------------------------------------

#PART 1: Lets take a SUBQUERY from before and convert it to CTO:
-- The SUBQUERY from before is as below:
SELECT AVG(orders) 
FROM
(SELECT orderDate, COUNT(orderNumber) AS orders
FROM orders
GROUP BY orderDate) AS T1
WHERE orderDate > '2005-05-01';
#OUTPUT:
-- AVG(orders)
-- '1.2727'
-- ----------------------------------------------------------------------------------------------------------------------------------

-- #PART 2: But now with CTE:
WITH cte_orders as 
(SELECT orderDate, COUNT(orderNumber) AS orders
FROM orders
GROUP BY orderDate) 

SELECT AVG(orders) 
FROM cte_orders
WHERE orderDate > '2005-05-01';
#OUPUT: is the same as PART 1
-- ----------------------------------------------------------------------------------------------------------------------------------

-- #PART 3: We can use 'multiple' CTEs, we just need to seperate them with a comma: BUT WE WILL DO IT IN ANOTHER SECTION
-- THIS IS JUST AN EXAMPLE OF ADDING MULTIPLE CTEs:

-- WITH cte_orders as 
-- (SELECT orderDate, COUNT(orderNumber) AS orders -- CTE 1
-- FROM orders
-- GROUP BY orderDate) , 

-- cte_payments -- CTE 2
-- (SELECT * FROM payments)

-- SELECT AVG(orders) 
-- FROM cte_orders
-- WHERE orderDate > '2005-05-01' 

