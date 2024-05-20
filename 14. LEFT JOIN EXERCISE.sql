-- Show all customers and their orders, even if they made no orders. 
-- Both tables have a *cust_code* field
-- 2 tables have been created - customer and orders.
-- Display all columns from both tables to show each customer and their orders, EVEN IF the customer made no orders.

-- ANSWER: LEFT JOIN
-- EXPLANATION: "EVEN IF the customer made no orders." means we can have null values thus LEFT JOIN
select *
from customers A; -- check for common column which is *customerNumber* here
select *
from orders B; -- check for common column which is *customerNumber* here

select *
from customers A
left join orders B
on A.customerNumber = B.customerNumber
-- # RESULT: Display all columns from both tables to show each customer and their orders, EVEN IF the customer made no orders