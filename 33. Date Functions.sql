# -----------------------      See today's date    ---------------------
select now();
#OUTPUT:
-- now()
-- '2024-08-30 16:41:09'
-- ______________________________________________________________________________________________

-- --------                 #1. YEAR, MONTH AND DAY         ------------------
-- Year, Month and Day return the date part in a new column
-- based on the column you enter inside the brackets:
select ordernumber,
orderdate,
year(orderdate) as year,
month(orderdate) as month,
day(orderdate) as day
from classicmodels.orders;

#OUTPUT:
-- ordernumber, orderdate, year, month, day
-- '10100','2003-01-06','2003','1','6'
-- '10101','2003-01-09','2003','1','9'
-- '10102','2003-01-10','2003','1','10'
-- '10103','2003-01-29','2003','1','29'
-- '10104','2003-01-31','2003','1','31'
-- '10105','2003-02-11','2003','2','11'
-- ______________________________________________________________________________________________

#2. ---------                   DateDiff          ----------------
-- Shows the difference between two dates in days
-- So for each order number we can see the days until they are required:

# EXAMPLE 1
select a.ordernumber,
datediff(requireddate, orderdate) days_until_required
from classicmodels.orders a;

#OUTPUT:
-- ordernumber, days_until_required
-- '10100','7'
-- '10101','9'
-- '10102','8'
-- '10103','9'

# EXAMPLE 2
select a.ordernumber,
requireddate,
orderdate,
datediff(requireddate, orderdate) days_until_required
from classicmodels.orders a;
#OUTPUT:
-- ordernumber, requireddate, orderdate, days_until_required
-- '10100', '2003-01-13', '2003-01-06', '7'
-- '10101', '2003-01-18', '2003-01-09', '9'
-- '10102', '2003-01-18', '2003-01-10', '8'

# EXAMPLE 3: We change the requireddate to now
select a.ordernumber,
requireddate,
orderdate,
datediff(now(), orderdate) days_until_required
from classicmodels.orders a;
#OUTPUT:
-- ordernumber, requireddate, orderdate, days_until_required
-- '10100', '2003-01-13', '2003-01-06', '7907'
-- '10101', '2003-01-18', '2003-01-09', '7904'
-- '10102', '2003-01-18', '2003-01-10', '7903'

# EXAMPLE 4: If we divide days by 365, we will get the years
select a.ordernumber,
requireddate,
orderdate,
datediff(now(), orderdate)/365 days_until_required
from classicmodels.orders a;
#OUTPUT:
-- ordernumber, requireddate, orderdate, days_until_required
-- '10100', '2003-01-13', '2003-01-06', '21.6630'
-- '10101', '2003-01-18', '2003-01-09', '21.6548'
-- '10102', '2003-01-18', '2003-01-10', '21.6521'

-- __________________________________________________________________________________________________________

#----------               DATE_ADD and DATE_SUB             --------------------
select a.ordernumber,
requireddate,
orderdate,
datediff(now(), orderdate) days_until_required
from classicmodels.orders a;


#a. DATE_ADD
-- You can add days, months or years from any date column using this function
-- Add 1 year onto the required date column

select*,
date_add(orderdate, interval 1 year) as one_year_after
from orders;
#OUTPUT:
--  orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber, ""one_year_after""
-- '10100', '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, '363', '2004-01-06'
-- '10101', '2003-01-09', '2003-01-18', '2003-01-11', 'Shipped', 'Check on availability.', '128', '2004-01-09'

#b. DATE_SUB
-- You can add days, months or years from any date column using this function
-- Add 1 year onto the required date column
select*,
date_sub(orderdate, interval 2 month) as two_months_ago
from orders;
#OUTPUT:
-- orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber, ""two_months_ago""
-- '10100', '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, '363', '2002-11-06'
-- '10101', '2003-01-09', '2003-01-18', '2003-01-11', 'Shipped', 'Check on availability.', '128', '2002-11-09'
-- '10102', '2003-01-10', '2003-01-18', '2003-01-14', 'Shipped', NULL, '181', '2002-11-10'

#c. DATE_ADD and DATE_SUB:
select*,
date_add(orderdate, interval 1 year) as one_year_after,
date_sub(orderdate, interval 2 month) as two_months_ago
from orders;
#OUTPUT:
-- orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber, ""one_year_after"","" two_months_ago""
-- '10100', '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, '363', '2004-01-06', '2002-11-06'
-- '10101', '2003-01-09', '2003-01-18', '2003-01-11', 'Shipped', 'Check on availability.', '128', '2004-01-09', '2002-11-09'
-- ______________________________________________________END______________________________________________

-- __________________________                -- #  DATE_SUB USING WHERE      _________________________________

-- -- You can subtract days, months, years etc from any date column using this function using WHERE
#CURDATE() is a function in MySQL that returns the current date in the format YYYY-MM-DD. It doesn't include the time portion, only the date.
-- For example, if today's date is August 30, 2024, CURDATE() would return 2024-08-30.

#1.If you want to filter orders based on the results of date_add and date_sub:
SELECT *,
       DATE_ADD(orderdate, INTERVAL 1 YEAR) AS one_year_after, #thus >=CURDATE() or current date. as its 1 year later
       DATE_SUB(orderdate, INTERVAL 2 MONTH) AS two_months_ago #thus <=CURDATE() or current date. as its 2 months ago
FROM orders
WHERE DATE_ADD(orderdate, INTERVAL 1 YEAR) >= CURDATE()
   OR DATE_SUB(orderdate, INTERVAL 2 MONTH) <= CURDATE();
#OUTPUT:
-- orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber, one_year_after, two_months_ago
-- '10100', '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, '363', '2004-01-06', '2002-11-06'
-- '10101', '2003-01-09', '2003-01-18', '2003-01-11', 'Shipped', 'Check on availability.', '128', '2004-01-09', '2002-11-09'

#2.If you only want to filter based on the original orderdate:
SELECT *,
       DATE_ADD(orderdate, INTERVAL 1 YEAR) AS one_year_after,
       DATE_SUB(orderdate, INTERVAL 2 MONTH) AS two_months_ago
FROM orders
WHERE orderdate >= CURDATE() - INTERVAL 1 YEAR
   OR orderdate <= CURDATE() + INTERVAL 2 MONTH;
#OUTPUT:
-- rderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber, one_year_after, two_months_ago
-- '10100', '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, '363', '2004-01-06', '2002-11-06'
-- '10101', '2003-01-09', '2003-01-18', '2003-01-11', 'Shipped', 'Check on availability.', '128', '2004-01-09', '2002-11-09'











-- select *
-- from classicmodels.orders a
-- where orderdate >= (“20060101”, interval 1 year);

-- SELECT *
-- FROM classicmodels.orders a
-- WHERE orderdate >= DATE_ADD('2006-01-01', INTERVAL 1 YEAR);