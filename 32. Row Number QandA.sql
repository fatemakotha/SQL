#1) Display the orderdate, ordernumber,
-- salesrepemployeenumber for each sales reps second
-- order.
############################################     ANSWER      ######################################
-- ANS: We need to use the following TABLES:
-- A. orders
-- B. customers - has *salesrepemployeenumber*
-- C. employees
#Step: We need to bring our customers table because it has *salesrepemployeenumber*
#Step: An then we can join the employees table on this
#Now, the employees table has the employee number which will match the salesrepemployeenumber

select * 
from orders t1 #we name this as t1
#And what we will do is just, we will inner join our customers table t2 on orders table t1
inner join customers t2
on t1.customernumber = t2.customerNumber
#We can see all ur customer table data is on the right hand side which has the salesrepemployeenumber
#So now we can join our employees table:
inner join employees t3
on t2.salesRepEmployeeNumber = t3.employeeNumber;
#Now we will have all the columns that we need

#OUTPUT:
# orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber, customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit, employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle
#'10123', '2003-05-20', '2003-05-29', '2003-05-22', 'Shipped', NULL, '103', '103', 'Atelier graphique', 'Schmitt', 'Carine ', '40.32.2555', '54, rue Royale', NULL, 'Nantes', NULL, '44000', 'France', '1370', '21000.00', '1370', 'Hernandez', 'Gerard', 'x2028', 'ghernande@classicmodelcars.com', '4', '1102', 'Sales Rep'

-- -------------------------------------------------------------------------------------------------------------------------------------

-- So rather than bringing back everything, we will just select:
-- orderDate, ordernumber, salesrepemployeenumber:
select orderDate, t1.orderNumber, salesRepEmployeeNumber
from orders t1 #we name this as t1
#And what we will do is just, we will inner join our customers table t2 on orders table t1
inner join customers t2
on t1.customernumber = t2.customerNumber
#We can see all ur customer table data is on the right hand side which has the salesrepemployeenumber
#So now we can join our employees table:
inner join employees t3
on t2.salesRepEmployeeNumber = t3.employeeNumber;
#Now we will have all the columns that we need

#OUTPUT:
# orderDate, orderNumber, salesRepEmployeeNumber
#'2003-03-26', '10113', '1165'
#'2003-07-02', '10135', '1165'
#'2003-08-08', '10142', '1165' ** we can see that its not ordered by the sales rep order date


-- -------------------------------------------------------------------------------------------------------------------------------------


#So, to show each salesrep second order we will use row number and number each order on the saleresemployeenumber column depending on the date it was made:
#we want to partition it by each salesrepemployeenumber, and we order by the orderdate and name it as the repordernumber
#So to do that I will Just add a new column and then start off with our row number
#And what we will do is just, we will inner join our customers table t2 on orders table t1
#We can see all ur customer table data is on the right hand side which has the salesrepemployeenumber
#So now we can join our employees table:

select orderdate, t1.ordernumber, salesrepemployeenumber, #without the comma ('), the ro_number won't work
row_number() over (partition by salesrepemployeenumber order by orderdate) as repordernumber

from orders t1 
inner join customers t2
on t1.customernumber = t2.customerNumber
join employees t3
on t2.salesrepemployeenumber = t3.employeenumber;

#OUTPUT:
# orderdate, ordernumber, salesrepemployeenumber, repordernumber
#'2003-03-25', '10111', '1165', '1'
#'2003-03-26', '10113', '1165', '2'
#'2003-07-02', '10135', '1165', '3'
-- *** We can see that the sales rep order number is ordered by the orderdate
-- ***For example sales rep 1165 has made 3 orders and we can see that they are ordered by each order date

-- -------------------------------------------------------------------------------------------------------------------------------------
#FINAL RESUST WE WANT : We can get the SECOND order number for everyone:
#But as we know that we can't just put in a WHERE, we must use CTE:

with cte_main as
(select orderdate, t1.ordernumber, salesrepemployeenumber, #without the comma ('), the ro_number won't work
row_number() over (partition by salesrepemployeenumber order by orderdate) as repordernumber

from orders t1 
inner join customers t2
on t1.customernumber = t2.customerNumber
join employees t3
on t2.salesrepemployeenumber = t3.employeenumber)

select * from cte_main
where repordernumber = 2;

#OUTPUT: So now we have each salesrep and their second order number:
-- orderdate, ordernumber, salesrepemployeenumber, repordernumber
-- '2003-01-29','10103','1504','2'
-- '2003-02-17','10106','1401','2'
-- '2003-03-10','10109','1323','2'
-- '2003-03-26','10113','1165','2'
-- '2003-04-04','10115','1286','2'
-- '2003-04-16','10117','1621','2'
-- '2003-05-07','10121','1337','2'
-- '2003-05-20','10123','1370','2'
-- '2003-05-21','10125','1611','2'
-- '2003-05-28','10126','1702','2'
-- '2003-06-12','10129','1501','2'
-- '2003-06-16','10130','1216','2'
-- '2003-07-07','10138','1612','2'
-- '2003-08-25','10145','1166','2'
-- '2003-09-05','10147','1188','2'

