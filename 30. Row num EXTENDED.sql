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
#((ORDER BY orderdate: This specifies the order in which the rows are numbered within each partition.
# The rows are ordered by orderdate in ascending order by default.))
#AS purchase_number: This is an alias for the result of the ROW_NUMBER() function. It represents the sequence number of each purchase for a customer.

ROW_NUMBER() OVER (PARTITION BY t3.customernumber ORDER BY t1.orderdate) AS NumbnerOfPurchase

#t3.customername, t1.customernumber, t1.ordernumber, orderdate, productcode
#((These are the columns that will be included in the result set.
#Each of these columns is coming from different tables as indicated by the table aliases (t1, t2, t3).))

FROM classicmodels.orders t1

JOIN classicmodels.orderdetails t2 ON t1.ordernumber = t2.ordernumber
/** This performs an inner join with the orderdetails table, aliased as t2. (with the matching records of the "orders" table)
The join condition is that the 'ordernumber' in 'orders (t1)' must match the 'ordernumber' in 'orderdetails (t2)'. 
This join brings in details about each order.r*/
JOIN classicmodels.customers t3 ON t1.customernumber = t3.customernumber

ORDER BY t3.customername;

#OUTPUT:
-- # customername, customernumber, ordernumber, orderdate, productcode, NumbnerOfPurchase
-- 'Alpha Cognac', '242', '        10136',    '2003-07-04', 'S18_1129', '1'
-- 'Alpha Cognac', '242',          '10136',   '2003-07-04', 'S18_1984', '2'


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

#OUTPUT:
-- customername, customernumber, ordernumber, order_date, product_code, NumbnerOfPurchase
-- 'Alpha Cognac', '242',       '10136', '    2003-07-04', 'S18_1129', '1'
-- 'Alpha Cognac', '242',       '10136',     '2003-07-04', 'S18_1984', '2'

/*-----------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------*/

#remove 'productCode' which comes from our 'orderdetails' table'
select distinct
t3.customername,
t1.customernumber,
t1.ordernumber,
orderdate,

row_number() over (partition by t3.customernumber order by orderdate) as NumbnerOfPurchases

from classicmodels.orders t1

##need to remove this join
-- JOIN classicmodels.orderdetails t2 ON t1.ordernumber = t2.ordernumber 
join classicmodels.customers t3 on t1.customernumber = t3.customernumber
order by t3.customername;
#Now if we run this we will dee it broken down by 'orderdate' and 'ordernumber'

#OUTPUT:
-- # customername, customernumber, ordernumber, orderdate, NumbnerOfPurchases
-- 'Alpha Cognac', '242',          '10136',   '2003-07-04', '1'
-- 'Alpha Cognac', '242',          '10178',   '2003-11-08', '2'

/*-----------------------------------------------------------------------------------------*/
##. We don't know which products were ordered, but we're actually counting how many puschaces happened
select distinct
t3.customername,
t1.customernumber,
t1.ordernumber,
orderdate,
productcode,
row_number() over (partition by t3.customernumber order by orderdate) as NumbnerOfPurchases #**
from classicmodels.orders t1
join classicmodels.orderdetails t2 on t1.ordernumber = t2.ordernumber
join classicmodels.customers t3 on t1.customernumber = t3.customernumber
order by t3.customername;

#OUTPUT:
-- # customername, customernumber, ordernumber, orderdate, productcode, NumbnerOfPurchases
-- 'Alpha Cognac', '242',          '10136',   '2003-07-04', 'S18_1129', '1'
-- 'Alpha Cognac', '242',          '10136',   '2003-07-04', 'S18_1984', '2'

/*-----------------------------------------------------------------------------------------*/
#We can break this down and partition with the 'ordernumber' also
select distinct
t3.customername,
t1.customernumber,
t1.ordernumber,
orderdate,
productcode,
row_number() over (partition by t3.customernumber, t1.ordernumber order by orderdate) as NumbnerOfPurchases #***
from classicmodels.orders t1
join classicmodels.orderdetails t2 on t1.ordernumber = t2.ordernumber
join classicmodels.customers t3 on t1.customernumber = t3.customernumber
order by t3.customername;

#OUTPUT:
-- customername, customernumber, ordernumber, orderdate, productcode, NumbnerOfPurchases
-- 'Alpha Cognac', '242',       '10136',    '2003-07-04', 'S18_1129', '1'
-- 'Alpha Cognac', '242',       '10136',    '2003-07-04', 'S18_1129', '1'

/*-----------------------------------------------------------------------------------------*/
select distinct
t3.customername,
t1.customernumber,
t1.ordernumber,
orderdate, 
#removed 'productcode'


row_number() over (partition by t3.customernumber order by orderdate) as NumbnerOfPurchases 
#removed 'ordernumber' from partition

from classicmodels.orders t1
#remove the 'productcode' anj join into 'orderdetwils'
#join classicmodels.orderdetails t2 on t1.ordernumber = t2.ordernumber
join classicmodels.customers t3 on t1.customernumber = t3.customernumber
order by t3.customername;

#OUTPUT:
-- # customername, customernumber, ordernumber, orderdate,   NumbnerOfPurchases
-- 'Alpha Cognac', '242',          '10136',    '2003-07-04',  '1'
-- 'Alpha Cognac', '242',          '10136',    '2003-07-04    '1'

/*-----------------------------------------------------------------------------------------*/
#We want to show each customer's second purchase date:
#We would think we can just add a WHERE
#But we can't do that becauws windows functions can't do that yet
# *** so instead we use CTE;

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
Select * from main_cte
#Now we can add WHERE:
WHERE NumbnerOfPurchases = 2

#OUTPUT:
-- customername,     customernumber, ordernumber, orderdate, NumbnerOfPurchases
-- 'Alpha Cognac',     '242',        '10178'.   ,'2003-11-08'    , '2'
-- 'Amica Models & Co.','249',       '10293',    '2004-09-09'    , '2'

/*-----------------------------------------------------------------------------------------*/
                    Q.   What is the RowNum value assigned to the product with the highest price?
                    A.   1
/*
-- EXPLANATION: 
--  If you're asking about the RowNum value for the product with the overall highest price in the entire table, 
-- the query you provided doesn't directly handle that since it's partitioning by PRODUCT.
-- However, within each PRODUCT partition, the highest-priced product will always have a Row_Num value of 1. */
    
select product price,
row_number() over (partition by PRODUCT order by PRICE DESC)
as Row_Num
from products;
