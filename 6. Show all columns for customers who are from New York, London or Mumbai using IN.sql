-- Show all columns for customers who are from New York, London or Mumbai using IN ***
select *
from customers;


select *
from customers
where city in ('Mumbai') 
or city in ('New York') 
or city in ('London');

-- Or you can do the following for the same result
select *
from customer
where cust_city in ('New York', 'London', 'Mumbai');