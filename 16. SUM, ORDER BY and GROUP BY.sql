--             ---------------------------------------------BOILERPLATE-----------------------------------------------------
select * 
from payments;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1.  ** SUM **
-- We can sum "any column" which displays a "value", and display it broken down by a certain field such as product or date.
-- Name a column using AS
-- Any non-aggregated column we displayed must be used in a group by clause

-- EXAMPLE CODE:
-- SELECT paymentDate, sum(amount) as total_payments #SUM adds up the 'amounts' made in the 'same date'
-- FROM classicmodels.payments
-- group by paymentDate; #arranges the total_payments column in 'ascending order'

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2. ** SUM and GROUP BY:
SELECT paymentDate, sum(amount) as payment -- we select the 'paymentDate' column and the s'um of the amount(and name that column payment)'
FROM payments -- from the 'payments column'
GROUP BY paymentDate; -- Any non-aggregated column we displayed must be used in a group by clause
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3. ** If we do not use 'as payment', the sum column will be named as 'sum(amount)'
SELECT paymentDate, sum(amount)
FROM payments
GROUP BY paymentDate -- Any non-aggregated column we displayed must be used in a group by clause
ORDER BY paymentDate; -- will be in ascending order
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------

-- 4. ** We added ORDER BY, so that the payments are showed in an ascending order
SELECT paymentDate, sum(amount) as payment
FROM payments
GROUP BY paymentDate -- Any non-aggregated column we displayed must be used in a group by clause
ORDER BY paymentDate; -- will be in ascending order
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------

-- 5. ** We can also ORDER BY and GROUP BY using the "column number" in 'ascending order'
-- In this case the paymentDate is column 1 
SELECT paymentDate, sum(amount) as payment
FROM payments
GROUP BY 1 -- Any non-aggregated column we displayed must be used in a group by clause
ORDER BY 1; -- will be in ascending order
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------

-- 6. 88 We can also ORDER BY and GROUP BY using the column number in 'descending order'
-- In this case the paymentDate is column 1 
SELECT paymentDate, sum(amount) as payment
FROM payments
GROUP BY 1 -- Any non-aggregated column we displayed must be used in a group by clause
ORDER BY 1 desc; -- will be in descending order
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------

