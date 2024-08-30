#------------------          CAST            ---------------
-- Used to change the datatype of a column.
-- Common to have to do this when joining tables together, where one key is an integer or varchar and the other is in date format.
SELECT *,
cast(paymentDate as datetime) as datetime_type
FROM payments;
#OUTPUT:
-- customerNumber, checkNumber, paymentDate, amount, datetime_type
-- '103', 'HQ336336', '2004-10-19', '6066.78', '2004-10-19 00:00:00'
-- '103', 'JM555205', '2003-06-05', '14571.44', '2003-06-05 00:00:00'
-- '103', 'OM314933', '2004-12-18', '1676.14', '2004-12-18 00:00:00'
-- ____________________________________________________________________________________________________




#------------------          SUB STRING            ---------------
####SYNTAX###
# ***. SELECT SUBSTRING(columnname, startfrom, length) ****

-- Substring returns a specified length of any string column you input:
#EX-1
SELECT CUSTOMERNUMBER,
PAYMENTDATE,
SUBSTRING(PAYMENTDATE, 1,7) AS MONTH_KEY #Starts with 1st and takes 7 letters. 2004-10-19 to "2004-10"
FROM CLASSICMODELS.PAYMENTS;
#OUTPUT:
-- CUSTOMERNUMBER, PAYMENTDATE, MONTH_KEY
-- '103', '2004-10-19', '2004-10'
-- '103', '2003-06-05', '2003-06'

#EX-2
SELECT CUSTOMERNUMBER,
PAYMENTDATE,
SUBSTRING(PAYMENTDATE, 7) AS MONTH_KEY #Takes only character AFTER THE 7TH. 2004-10-19 to "0-19", FROM 7TH TO END
FROM CLASSICMODELS.PAYMENTS;
#OUTPUT:
-- CUSTOMERNUMBER, PAYMENTDATE, MONTH_KEY
-- '103', '2004-10-19', '0-19'
-- '103', '2003-06-05', '6-05'

#EX-3

SELECT CUSTOMERNUMBER,
PAYMENTDATE,
-- 7: This is the length of the substring to extract, starting from the position specified (6th character). 
-- So, the function will take 7 characters starting from the 6th position.
SUBSTRING(PAYMENTDATE, 6, 7) AS MONTH_KEY 
FROM CLASSICMODELS.PAYMENTS;
#OUTPUT:
-- CUSTOMERNUMBER, PAYMENTDATE, MONTH_KEY
-- '103', '2004-10-19', '10-19'
-- '103', '2003-06-05', '06-05'

#EX-4
SELECT country, 
SUBSTRING(country,1,2) as code #Starts from the first letter and takes 2 letters **
from customers;
#OUTPUT:
-- country, code
-- 'France', 'Fr'
-- 'USA', 'US'
-- 'Australia', 'Au'

-- ____________________________________________________________________________________________________




#------------------          CONCAT            ---------------
-- Used to merge 2 or more columns together:
####SYNTAX###
# ***. SELECT concat(column1, column2) ****

#EX. 1
SELECT EMPLOYEENUMBER,
LASTNAME,
FIRSTNAME,
CONCAT(firstName, ' ', Lastname) AS FULLNAME # ' ' GIVES A SPACE BETWEEN FIRST AND LAST NAME
FROM classicmodels.employees;
#OUTPUT:
-- EMPLOYEENUMBER, LASTNAME, FIRSTNAME, FULLNAME
-- '1002', 'Murphy', 'Diane', 'Diane Murphy'
-- '1056', 'Patterson', 'Mary', 'Mary Patterson'

#EX. 2
SELECT CUSTOMERNAME, 
CONCAT(city, country) as city_country
from customers;
#OUTPUT:
-- USTOMERNAME, city_country
-- 'Atelier graphique', 'NantesFrance'
-- 'Signal Gift Stores', 'Las VegasUSA'

-- ____________________________________________________________________________________________________

