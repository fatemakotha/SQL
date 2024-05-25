-- ------------------------------------------------ CASE STATEMENT (also known as IF ELSE in python) ----------------------------------------------
-- We can start by entering the first condition and then specifying what we want to return if that condition is met
-- and then add as many conditions as we want
#SAMPLE CODE:
-- CASE WHEN condition1 THEN output1
-- WHEN condition2 THEN output2
-- WHEN condition3 THEN output3
-- ELSE output4
-- END
-- ----------------------------------------------------------------------------------------------------------------------------------
#EXAMPLE CODE:
-- select
-- case when creditLimit < 75000 then 'a: Less than $75k'
-- when creditLimit between 75000 and 100000 then 'b: $75k -
-- $100k'
-- when creditLimit between 100000 and 150000 then 'c: $100k
-- - $150k'
-- when creditLimit > 150000 then 'd: Over $150k'
-- else 'Other' end as credit_limit_grp, -- Good practice to put a final OTHER in case a mistake was made**
-- count(distinct c.customernumber) as customers
-- from classicmodels.customers c
-- group by 1

#OUPUT: will be of DATATYPE 'character' as we put them in '' marks **
-- ----------------------------------------------------------------------------------------------------------------------------------

# BOILERPLATE
SELECT * FROM customers;
-- ----------------------------------------------------------------------------------------------------------------------------------

SELECT
CASE WHEN creditLimit < 75000 THEN 'a: Less than $75k'
WHEN creditLimit between 75000 AND 100000 THEN 'b: $75k -
$100k'
WHEN creditLimit between 100000 AND 150000 THEN 'c: $100k
- $150k'
WHEN creditLimit > 150000 THEN 'd: Over $150k'
ELSE 'Other' END AS credit_limit_grp, -- Good practice to put a final OTHER in case a mistake was made**
-- We are going to COUNT DISTINCT customerNumber to show how many customers fall into these 4 groups
COUNT(DISTINCT customerNumber) AS differentcustomers -- We are going to call the column with number of DISTINCT customers as 'differentcustomers'
from customers 
group by 1; -- '1' means instructing the database to group the results based on the first column in the SELECT list. **
-- We can also change '1' to our colume name 'credit_limit_grp' **
#OUPUT:
-- credit_limit_grp, customers
-- 'a: Less than $75k', '60'
-- 'b: $75k -\n$100k', '37'
-- 'c: $100k\n- $150k', '23'
-- 'd: Over $150k', '2'















-- ----------------------------------------------------------------------------------------------------------------------------------
-- select
-- case when creditLimit < 75000 then 'a: Less than $75k'
-- when creditLimit between 75000 and 100000 then 'b: $75k -
-- $100k'
-- when creditLimit between 100000 and 150000 then 'c: $100k
-- - $150k'
-- when creditLimit > 150000 then 'd: Over $150k'
-- else 'Other' end as credit_limit_grp,
-- count(distinct c.customernumber) as customers
-- from classicmodels.customers c
-- group by 1