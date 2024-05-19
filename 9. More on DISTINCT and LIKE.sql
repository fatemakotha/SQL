-- Select all *distinct* orders and ORDER BY the *order date*
-- The SQL DISTINCT keyword is used to retrieve unique values from a specified column or set of columns in a database table
SELECT distinct orderdate
FROM classicmodels.orders
ORDER BY orderdate; -- ascending**

-- Select all *distinct* orders and ORDER BY the *order date*
SELECT distinct orderdate
FROM classicmodels.orders
ORDER BY orderdate desc; -- descending**

-- Get the customers who have used the word "negotiate"
SELECT *
FROM classicmodels.orders
WHERE lower(COMMENTS) LIKE '%negotiate%';

-- Or we can use lower and get the same output
SELECT *
FROM classicmodels.orders
WHERE upper(COMMENTS) LIKE '%negotiate%'