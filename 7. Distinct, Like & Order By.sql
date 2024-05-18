SELECT *
FROM customers;

-- *************Find all the cities that have the word *New* in them******
SELECT *
FROM customers
WHERE CITY LIKE '%New%';

-- Find all the cities that have the word new in them with **upper**
-- This is so that there is no error incase there is a mix of upper and lower cases in the *Nwe*
SELECT *
FROM customers
WHERE upper(CITY) LIKE '%New%';

-- Find all the cities that have the word new in them with **upper**
-- This is so that there is no error incase there is a mix of upper and lower cases in the *Nwe*
SELECT *
FROM customers
WHERE upper(CITY) LIKE '%New%';

-- Find all the **DISTINCT** cities that have the word new in them 
SELECT distinct CITY
FROM customers
WHERE upper(CITY) LIKE '%New%';

-- Find all the **DISTINCT** cities that have the word new in them 
-- Changing CITY to city does not change the output
SELECT distinct city
FROM customers
WHERE upper(CITY) LIKE '%New%';



-- ********************************** ORDER BY ****************************

-- ORDER BY ascending order using the column *lastname* 
select *
from employees
order by lastname;

-- ORDER BY descending order using the column *lastname* 
select *
from employees
order by lastname desc;

-- ORDER BY descending order using the columns *lastname* and also the  *firstname*
select *
from employees
order by lastname desc, firstname desc





