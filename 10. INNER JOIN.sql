SELECT *
FROM orders
where ordernumber = 101100; -- Gives only customer number which is 363

select * 
from customers
where customerNumber = 363; -- Gives all info on the customer number which is 363

-- But now we will join the table so we can have all the info in the *same table*

-- ###### INNER JOIN BOILER PLATE: ########
-- SELECT *
-- FROM classicmodels.orders T1
-- INNER JOIN classicmodels.customers T2
-- ON T1.customernumber = T2.customernumber


-- WE CAN SEE THAT THE *customernumber* is the common key between the 2 tables: *orders* and *customers*
select *
from customers;

select *
from orders;


-- START THE JOINING
SELECT *
FROM orders T1 -- select all columns from the *orders* table, and we name the *orders* table as *T1* OR *t1*
INNER JOIN customers T2 -- We will do an inner join of our *customers* table and name it *T2* or *t2*
on T1.customerNumber = T2.customerNumber; -- we want to join that on the "key" which is the *customernumber*, which is the common key between the 2 tables

-- **NOTE:
-- ***As INNER JOIN will only return matching rows, some customers in the *customers* table will not be diplayed as they have no orders
-- *** Result ***
-- The result of this query will be a combined set of columns from both orders and customers tables 
-- for rows where there is a matching customerNumber in both tables. 
-- The columns from both tables will be included in the result set, 
-- but only the rows with matching customerNumber values will be shown.

-- ########## OR ALTERNATIVELY we can just use JOIN which will be considered as an INNER JOIN #################
SELECT *
FROM orders T1
JOIN customers T2
on t1.customerNumber = T2.customerNumber;
