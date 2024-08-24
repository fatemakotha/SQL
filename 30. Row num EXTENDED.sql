select * from customers; /*customerNumber, customerName, contactLastName, contactFirstName*/ -- 1 1  
select * from orderdetails; /*orderNumber, productCode, quantityOrdered */ -- T2
select * from products; /*productCode, productName, productLine, */ -- 4
select * from orders; /*orderNumber, orderDate, customerNumber*/ -- 2 3 T1


/*-----------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------*/

-- Q. WHY GIVE TABLE NAMES?
-- A. n SQL, table aliases (like t1, t2, t3) are used to make the query more concise
--  and to reference columns from specific tables, especially when multiple tables are joined.
## NOTE ##
-- In the query you provided, orderdate and productcode are columns rather than tables, and they don't need explicit aliases like t1 or t2 because:

-- **Column Origin: Each column originates from a specific table, and it's usually clear from the context which table they come from. For instance:

-- ** orderdate comes from the orders table, aliased as t1.
-- ** productcode comes from the orderdetails table, aliased as t2.
-- ** Column Aliases: Aliases (t1, t2, t3) are used for tables, not columns. 
-- ** Columns are referred to directly in the SELECT clause, 
-- ** or you can give them new names using column aliases if needed (e.g., orderdate AS order_date).

SELECT DISTINCT
t3.customername,
t1.customernumber,
t1.ordernumber,
orderdate,     # orderdate and productcode are columns rather than tables, and they don't need explicit aliases like t1 or t2 because:
productcode, #and they don't need explicit aliases like t1 or t2 because:

#ROW_NUMBER() OVER (PARTITION BY t3.customernumber ORDER BY orderdate) AS purchase_number
#((ROW_NUMBER(): This is a window function that assigns a unique number to each row within a partition of a result set. 
#The numbering starts at 1 for each partition.))
#((PARTITION BY t3.customernumber: This clause divides the result set into partitions based on t3.customernumber. 
#Within each partition, the ROW_NUMBER() function is applied.))
#ORDER BY orderdate: This specifies the order in which the rows are numbered within each partition. The rows are ordered by orderdate in ascending order by default.
#AS purchase_number: This is an alias for the result of the ROW_NUMBER() function. It represents the sequence number of each purchase for a customer.

ROW_NUMBER() OVER (PARTITION BY t3.customernumber ORDER BY t1.orderdate) AS NumbnerOfPurchase

FROM classicmodels.orders t1

JOIN classicmodels.orderdetails t2 ON t1.ordernumber = t2.ordernumber
JOIN classicmodels.customers t3 ON t1.customernumber = t3.customernumber

ORDER BY t3.customername;

/*-----------------------------------------OR------------------------------------------------*/
SELECT DISTINCT
    t3.customername,
    t1.customernumber,
    t1.ordernumber,
    t1.orderdate AS order_date,
    t2.productcode AS product_code,
    
ROW_NUMBER() OVER (PARTITION BY t3.customernumber ORDER BY t1.orderdate) AS NumbnerOfPurchase

FROM classicmodels.orders t1

JOIN classicmodels.orderdetails t2 ON t1.ordernumber = t2.ordernumber
JOIN classicmodels.customers t3 ON t1.customernumber = t3.customernumber

ORDER BY t3.customername;

/*-----------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------*/

select distinct
t3.customername,
t1.customernumber,
t1.ordernumber,
orderdate,

row_number() over (partition by t3.customernumber order by orderdate) as NumbnerOfPurchases

from classicmodels.orders t1
join classicmodels.customers t3 on t1.customernumber = t3.customernumber
order by t3.customername;


/*-----------------------------------------------------------------------------------------*/

select distinct
t3.customername,
t1.customernumber,
t1.ordernumber,
orderdate,
productcode,
row_number() over (partition by t3.customernumber, t1.ordernumber order by orderdate) as NumbnerOfPurchases
from classicmodels.orders t1
join classicmodels.orderdetails t2 on t1.ordernumber = t2.ordernumber
join classicmodels.customers t3 on t1.customernumber = t3.customernumber
order by t3.customername;

/*-----------------------------------------------------------------------------------------*/
select distinct
t3.customername,
t1.customernumber,
t1.ordernumber,
orderdate,

row_number() over (partition by t3.customernumber order by orderdate) as NumbnerOfPurchases

from classicmodels.orders t1
join classicmodels.customers t3 on t1.customernumber = t3.customernumber
order by t3.customername;

/*-----------------------------------------------------------------------------------------*/
with main_cte as
(
select distinct
t3.customername,
t1.customernumber,
t1.ordernumber,
orderdate,

row_number() over (partition by t3.customernumber order by orderdate) as NumbnerOfPurchases

from classicmodels.orders t1
join classicmodels.customers t3 on t1.customernumber = t3.customernumber
order by customername

)
select * from main_cte

/*-----------------------------------------------------------------------------------------*/

with main_cte as
(
select distinct
t3.customername,
t1.customernumber,
t1.ordernumber,
orderdate,

row_number() over (partition by t3.customernumber order by orderdate) as NumbnerOfPurchases

from classicmodels.orders t1
join classicmodels.customers t3 on t1.customernumber = t3.customernumber
order by customername

)
select * from main_cte