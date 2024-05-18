-- Replacing IN and NOT IN using <> 

SELECT *
FROM employees;


SELECT *
FROM employees
WHERE upper(email) <>
'PMARSH@CLASSICMODELCARS.COM'
AND upper(email) <>
'GBONDUR@CLASSICMODELCARS.COM'
AND upper(email) <>
'ABOW@CLASSICMODELCARS.COM';

