-- 5. We can create *multiple flags*: comments that have "negotiate" and "dispute"
-- And we name the new columns as "disputed" and "negotiated"
SELECT *, CASE WHEN comments LIKE '%dispute%' THEN 1 ELSE 0 END AS disputed, CASE WHEN comments LIKE '%NEGOTIATE%' THEN 1 ELSE 0 END AS negotiated
FROM classicmodels.orders;
#OUTPUT: Show columns named "negotiated" and "disputed"
-- orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber, disputed, negotiated
-- '10100', '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, '363', '0', '0'
-- '10101', '2003-01-09', '2003-01-18', '2003-01-11', 'Shipped', 'Check on availability.', '128', '0', '0'

-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 6. Now, we DO NOT WANT TO CREATE A "FLAG" but instead we want the *OUTPUT* as a *STRING* that says 
-- "Negotiated Order" and 'Dusputed Order' instead of "1":
SELECT *, CASE WHEN comments LIKE '%dispute%' THEN 'Dusputed Order' ELSE 0 END AS disputed, 
CASE WHEN comments LIKE '%NEGOTIATE%' THEN 'Negotiated Order' ELSE 0 END AS negotiated
FROM classicmodels.orders;
##OUTPUT:
-- orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber, disputed, negotiated
-- '10107', '2003-02-24', '2003-03-03', '2003-02-26', 'Shipped', 'Difficult to negotiate with customer. We need more marketing materials', '131', '0', 'Negotiated Order'
-- '10124', '2003-05-21', '2003-05-29', '2003-05-25', 'Shipped', 'Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', '112', 'Dusputed Order', '0'

-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 7. Now we want "a new column" named "status_1" that says "no dipute" or "Negotiated order"
-- We will keep the FLAG for '%dispute%' but not the FLAG for '%NEGOTIATE%'
SELECT *, CASE WHEN comments LIKE '%dispute%' THEN 1 ELSE 0 END AS disputed, 
CASE WHEN comments LIKE '%NEGOTIATE%' THEN 'Negotiated Order'
WHEN comments LIKE '%dispute%' then 'Disputed Order'
else 'no dispute' end as status_1 -- name the new column as "status_1"
FROM classicmodels.orders;
#OUTPUT:
-- orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber, disputed, status_1
-- '10100', '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, '363', '0', 'no dispute'
-- '10107', '2003-02-24', '2003-03-03', '2003-02-26', 'Shipped', 'Difficult to negotiate with customer. We need more marketing materials', '131', '0', 'Negotiated Order'

-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 8. Now we want "a new column" named "status_1" that says "no dipute" or "Negotiated order"
-- We will keep the FLAG for '%dispute%' and also the FLAG for '%NEGOTIATE%'
SELECT *, CASE WHEN comments LIKE '%dispute%' THEN 1 ELSE 0 END AS disputed, 
CASE WHEN comments LIKE '%NEGOTIATE%' THEN 1 ELSE 0 END AS negotiated,
CASE WHEN comments LIKE '%NEGOTIATE%' THEN 'Negotiated Order'
WHEN comments LIKE '%dispute%' then 'Disputed Order'
else 'no dispute' end as status_1 -- name the new column as "status_1"
FROM classicmodels.orders;
#OUTPUT:
-- orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber, disputed, negotiated, status_1
-- '10100', '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, '363', '0', '0', 'no dispute'
-- '10107', '2003-02-24', '2003-03-03', '2003-02-26', 'Shipped', 'Difficult to negotiate with customer. We need more marketing materials', '131', '0', '1', 'Negotiated Order'

###### 9. SPECIAL EXAMPLE: For the same code above, if we add CASE infront
-- SELECT *, CASE WHEN comments LIKE '%dispute%' THEN 1 ELSE 0 END AS disputed, 
-- CASE WHEN comments LIKE '%NEGOTIATE%' THEN 1 ELSE 0 END AS negotiated,
-- CASE WHEN comments LIKE '%NEGOTIATE%' THEN 'Negotiated Order'
-- CASE WHEN comments LIKE '%dispute%' then 'Disputed Order' -- the code will run if we remove "CASE" from this line **
-- else 'no dispute' end as status_1 -- name the new column as "status_1"
-- FROM classicmodels.orders;

-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 10: We now want to rename the item "no dispute" to "no dispute or negotiate"
SELECT *, CASE WHEN comments LIKE '%dispute%' THEN 1 ELSE 0 END AS disputed, 
CASE WHEN comments LIKE '%NEGOTIATE%' THEN 1 ELSE 0 END AS negotiated,
CASE WHEN comments LIKE '%NEGOTIATE%' THEN 'Negotiated Order'
WHEN comments LIKE '%dispute%' then 'Disputed Order' -- the code will run if we remove "CASE" from this line **
else 'no dispute or negotiate' end as status_1 -- name the new column as "status_1"
FROM classicmodels.orders;
#OUTPUT: We only get "no dispute or negotiate" when the *comments* column is "NULL':
-- orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber, disputed, negotiated, status_1
-- '10100', '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, '363', '0', '0', 'no dispute or negotiate'
-- '10107', '2003-02-24', '2003-03-03', '2003-02-26', 'Shipped', 'Difficult to negotiate with customer. We need more marketing materials', '131', '0', '1', 'Negotiated Order'
-- '10114', '2003-04-01', '2003-04-07', '2003-04-02', 'Shipped', NULL, '172', '0', '0', 'no dispute or negotiate'
-- '10124', '2003-05-21', '2003-05-29', '2003-05-25', 'Shipped', 'Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', '112', '1', '0', 'Disputed Order'
