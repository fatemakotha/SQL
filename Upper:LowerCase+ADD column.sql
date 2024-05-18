SELECT *
FROM employees;

-- Even if the name is 'Leslie' use lower to find all the leslis
SELECT *
FROM employees
WHERE lower(firstName) = 'leslie';
-- Shows the same result
SELECT *
FROM employees
WHERE upper(firstName) = 'leslie';

-- Even if the email is 'dmurphy@classicmodelcars.com' 
-- use upper to find all the dmurphy@classicmodelcars.com
SELECT *
FROM employees
WHERE upper(email) = 'DMURPHY@CLASSICMODELCARS.COM';
-- Shows the same result
SELECT *
FROM employees
WHERE lower(email) = 'DMURPHY@CLASSICMODELCARS.COM';
-- CTRL+SHIFT+U will turn the email to UPPERCASE
SELECT *
FROM employees
WHERE upper(email) = 'mpatterso@classicmodelcars.com';

-- Add a column that shows all names in UPPERCASE
SELECT *, upper(firstName) as uppercasename
FROM employees