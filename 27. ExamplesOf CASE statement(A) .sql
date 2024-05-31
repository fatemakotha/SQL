
-- 1. Print all 'orders' with the word negotiate in it:
SELECT *
FROM classicmodels.orders
WHERE comments LIKE '%NEGOTIATE%';
#OUTPUT: Gives all "orders" with the word "NEGOTIATE" in it:
-- orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber
-- '10107', '2003-02-24', '2003-03-03', '2003-02-26', 'Shipped', 'Difficult to negotiate with customer. We need more marketing materials', '131'
-- '10206', '2003-12-05', '2003-12-13', '2003-12-08', 'Shipped', 'Can we renegotiate this one?', '202'
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 2. Lets FLAG any 'order' that has the word negotiate in it:
-- So what we could do rather than having a WHERE which is filtering out every single order that *does not* have "NEGOTIATE" in 'comments'
-- We will add it to it as a CASE statement
-- To do that, we bring back all rows:
SELECT *
FROM classicmodels.orders;

SELECT *, CASE WHEN comments LIKE '%NEGOTIATE%' THEN 1 ELSE 0 END AS negotiated -- Name the new column as "negotiated"
FROM classicmodels.orders;
#OUTPUT:
-- orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber, negotiated
-- '10100', '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, '363', '0'
-- '10101', '2003-01-09', '2003-01-18', '2003-01-11', 'Shipped', 'Check on availability.', '128', '0'

-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 3. Lets say we want to look at *other possible outcomes* of what the "comments" are:
-- Lets have a look at the "DISTINCT" comments:
-- some comments might be the same, but we want to look at the "DISTINCT" ones
SELECT DISTINCT comments
FROM classicmodels.orders;
# comments
-- NULL
-- 'Check on availability.'
-- 'Difficult to negotiate with customer. We need more marketing materials'
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 4. Now lets just show everything CASE when "disputed":
SELECT *, CASE WHEN comments LIKE '%dispute%' THEN 1 ELSE 0 END AS disputed  -- Name the new column as "disputed"
FROM classicmodels.orders;
#OUTPUT:
-- orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber, disputed
-- '10100', '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, '363', '0'
-- '10100', '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, '363', '0'

-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 5. We can create *multiple flags*: comments that have "negotiate" and "dispute"
-- And we name the new columns as "disputed" and "negotiated"
 SELECT *, CASE WHEN comments LIKE '%dispute%' THEN 1 ELSE 0 END AS disputed, CASE WHEN comments LIKE '%NEGOTIATE%' THEN 1 ELSE 0 END AS negotiated
FROM classicmodels.orders;
#OUTPUT: DOES NOT SHOW the column for "negotiated" ! ! !
-- WE NEED TO OPEN "A NEW QUERY"
-- orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber, disputed ? ? ?
-- '10100', '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, '363', '0'
-- '10100', '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, '363', '0'

-- -----------------------------------------------------------------------------------------------------------------------------------------------

