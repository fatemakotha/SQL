SELECT *
FROM employees;

-- Select from "employees" all people that do NOT have these 3 email addresses:
SELECT *
FROM employees
WHERE upper(email) not in 
( 'PMARSH@CLASSICMODELCARS.COM', 'GBONDUR@CLASSICMODELCARS.COM', 'ABOW@CLASSICMODELCARS.COM');
-- Does the same thing as above
SELECT *
FROM employees
WHERE upper(email) not in 
( 'PMARSH@CLASSICMODELCARS.COM', 
'GBONDUR@CLASSICMODELCARS.COM', 
'ABOW@CLASSICMODELCARS.COM');

-- Select from "employees" all people that HAVE ONLY THESE 3 email addresses:
SELECT *
FROM employees
WHERE upper(email) in 
( 'PMARSH@CLASSICMODELCARS.COM', 'GBONDUR@CLASSICMODELCARS.COM', 'ABOW@CLASSICMODELCARS.COM');
-- Using "lower" gives the same output at above
SELECT *
FROM employees
WHERE lower(email) in 
( 'PMARSH@CLASSICMODELCARS.COM', 'GBONDUR@CLASSICMODELCARS.COM', 'ABOW@CLASSICMODELCARS.COM');


-- ****** TEST BY ME:
-- *** Even if all the letters in an email have both upper AND lower case, it still does the same thing
SELECT *
FROM employees
WHERE upper(email) in 
( 'PMARSH@CLASSICmodelCARS.COM', 'gbondur@classicmodelcars.COM', 'ABOW@CLASSICMODELCARS.COM');


