--                              ------------------------- BOILERPLATE -------------------------------

SELECT paymentDate, sum(amount) as payment
FROM payments
GROUP BY paymentDate -- Any non-aggregated column we displayed must be used in a group by clause
ORDER BY paymentDate; 
-- RESULT: 'payment' is currently in 2 decimal places**
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------

--                               ------------------------------ ROUND ------------------------------
-- We can round the output of any query to a specified numner of decimal places:
-- The output of the previous query can be rounded to 1 decimal place by adding ROUND(columnname, 1)
-- You can change the 1 to the desired amount of decimal places

-- EXAMPLE CODE:
-- SELECT paymentDate, round( sum(amount), 1) as total_payments
-- FROM classicmodels.payments
-- group by paymentDate;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1. ROUND the 'payment' column to '1 decimal place
SELECT paymentDate, round(sum(amount), 1) as payment
FROM payments
GROUP BY paymentDate -- Any non-aggregated column we displayed must be used in a group by clause
ORDER BY paymentDate; -- will be in ascending order
-- RESULT: 'payment' is now in 21 decimal place **
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------

--                               ------------------------------ HAVING ------------------------------
-- Having is the same as WHERE, but is used after the group by clause with aggregate functions like SUM.
-- We can't put in WHERE for total payments which is 'greater than 50000' for example
-- because the 'calculation hasn't happened yet', and we must add it 'after' the 'group by' statement.
-- SO, for this EXAMPLE we will only display days which had total payments greater than (>) 50000 in 'descending order' ***
-- EXAMPLE CODE:
-- SELECT paymentDate, sum(amount) as total_payments
-- FROM classicmodels.payments
-- group by paymentDate
-- having total_payments > 50000
-- order by total_payments desc
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2. ** Show days where we only had payments of more than 50000, rounded to 1 decimal place, in 'ascending order':
SELECT paymentDate, round(sum(amount), 1) as total_payments
FROM payments
GROUP BY paymentDate
HAVING round(sum(amount), 1) > 50000
ORDER BY paymentDate;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3. ** Replace 'round(sum(amount), 1)' by 'total_payments':
SELECT paymentDate, round(sum(amount), 1) as total_payments
FROM payments
GROUP BY paymentDate
HAVING round(sum(amount), 1) > 50000
ORDER BY paymentDate;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------

-- 4. ** Show days before 2003-06-01, rounded to 1 decimal place, in 'ascending order':
-- This will 'remove' any mayments made before that date
SELECT paymentDate, round(sum(amount), 1) as total_payments
FROM payments
GROUP BY paymentDate
HAVING paymentDate > '2003-06-01'
ORDER BY paymentDate;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------

-- 5. ** Show days where we only had payments of more than 50000, rounded to 1 decimal place, in 'descending order':
SELECT paymentDate, round(sum(amount), 1) as total_payments
FROM payments
GROUP BY paymentDate
HAVING round(sum(amount), 1) > 50000
ORDER BY paymentDate desc;