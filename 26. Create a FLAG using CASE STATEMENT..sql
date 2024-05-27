-- ----------------------------------------- FLAG - USING CASE WHEN -----------------------------------------
-- We often use a CASE WHEN statement to
-- return only 2 possible values - True/False, sometimes (1 / 0, or Yes/No)
-- By flagging each row we can easily find rows which meet a condition, and when
-- the flag is 1/0 I can then SUM this column.

# BOILERPLATE EXAMPLE 1: This creates a flag which displays 1 when an order of motorcycles is 'EQUAL OR MORE THAN 40': ***
-- EXPLANATION OF THE CODE BELOW:
-- So for this QUERY, its creating a FLAG which displays '1', when an *order* of motorcycles is more tha '>' 40
-- And we have been able to check if an order was ' a motocycle' 
-- because we've joined the *ordersdetails* table to the *orders* table, on the 'orderNumber'
-- And from there, because the *orders* table breaks down the order by 'product', we can then join,
-- the *products* table on the 'productCode'
-- And then we can create our FLAG:
-- And we do this by adding '2 conditions', where 
-- the *first one* is for the *quantity ordered* to be greater tha '>' 40 *
-- the *second one* is where the product line equals to motorcycles *
-- AND IF 'BOTH" THESE "CONDITIONNS" ARE MET THEN IT WILL REUTN "1" **
-- OTHERWISE IT WILL RETURN "0"
-- And then we just end as the name of our column.

#AS WE ARE USING THE ORDERSTABLE AND THE ORDERDETAILS TABLE:
SELECT * FROM orders;
#OUTPUT:
-- orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber
-- '10100', '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, '363' . . . . . and so on

SELECT * FROM orderdetails;
#OUTPUT:
-- orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
-- '10100', 'S18_1749', '30', '136.00', '3'

SELECT * FROM products;
#OUTPUT:
-- orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber
-- '10100', '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, '363'


# CONCLUSION: "orderNumber" is what is "common" between the 2 tables *****
-- --------------------------------------------------------------------------------------------------------------------------------------------------------

# CODE STARTS HERE 
-- Select specific columns from the combined tables:
SELECT
    t1.orderNumber,          -- Select the order number from the orders table
    orderDate,               -- Select the order date from the orders table
    quantityOrdered,         -- Select the quantity ordered from the orderDetails table
    productName,             -- Select the product name from the products table
    productLine,             -- Select the product line from the products table

    -- Create a new column named "ordered_over/equalTo_40_motorcycles" using 'CASE':
    CASE 
        WHEN quantityOrdered >= 40 AND productLine = 'Motorcycles' THEN 1  -- If the quantity ordered is >= 40 and the product line is 'Motorcycles', set the value to 1
        ELSE 0                                                           -- Otherwise set it to 0
    END AS ordered_over_40_motorcycles -- Name the new column as "ordered_over_40_motorcycles"

FROM 
    classicmodels.orders t1  -- From the orders table, name it as as t1
JOIN 
    classicmodels.orderDetails t2 
    ON t1.orderNumber = t2.orderNumber -- Join the o*rders* table with the *orderDetails* table on the 'orderNumber' column
JOIN 
    classicmodels.products t3 
    ON t2.productCode = t3.productCode;     -- Join the *result* with the *products* table on the "productCode" column;

#CODE ENDS HERE
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

# BOILERPLATE EXAMPLE 2: We could use a CTE to SUM this column for each day: ***
-- EXPLANATION OF THE CODE BELOW:
-- What we can also do with the QUERY in BOILERPLATE EXAMPLE 1, is put it inside a CTS and the QUERY from that CTE *
-- so that we can sum the FLAG we just created to see *how many of the sales 'were over 40' and 'motorbikes'* **

# STARTS HERE 
-- with main_cte as
-- (
-- select
-- t1.ordernumber,
-- orderdate,
-- quantityordered,
-- productname,
-- productline,
-- case when quantityordered > 40 and productline = 'Motorcycles' then 1
-- else 0 end as ordered_over_40_motorcycles
-- from classicmodels.orders t1
-- join classicmodels.orderdetails t2 on t1.ordernumber = t2.ordernumber
-- join classicmodels.products t3 on t2.productcode = t3.productcode
-- )
-- select orderdate, sum(ordered_over_40_motorcycles) as over_40_bike_sale
-- from main_cte
-- group by orderdate #CODE ENDS HERE

#TASK: Use a CTE to SUM this column for each day
-- Define a Common Table Expression (CTE) named main_cte
WITH main_cte AS (
    -- Selecting specific columns and calculating a new column within the CTE
    SELECT
        t1.orderNumber, -- Select the order number from the orders table
        orderDate, -- Select the order date from the orders table
        quantityOrdered, -- Select the quantity ordered from the orderDetails table
        productName, -- Select the product name from the products table
        productLine, -- Select the product line from the products table
        
        -- Create a new column named "ordered_over_40_motorcycles"
        CASE 
            WHEN quantityOrdered > 40 AND productLine = 'Motorcycles' THEN 1  -- If the quantity ordered is greater than 40 and the product line is 'Motorcycles', set the value to 1
            ELSE 0                                                           -- Otherwise, set the value to 0
        END AS ordered_over_40_motorcycles -- Name the new column as "ordered_over_40_motorcycles"
    
    -- Specify the tables and join conditions for the CTE
    FROM 
        classicmodels.orders t1 -- From the orders table, names it as t1
    JOIN 
        classicmodels.orderDetails t2 ON t1.orderNumber = t2.orderNumber -- Join the orders table with the '*orderDetails* table' on the '"orderNumber" column'
    JOIN 
        classicmodels.products t3 ON t2.productCode = t3.productCode -- Join the result with the '*products* table' on the '"productCode" column'
)
-- Main query to aggregate data from the CTE
-- In SQL, "aggregating data" refers to the process of summarizing multiple rows of data into a single result
SELECT 
    orderDate, -- Select the order date
    SUM(ordered_over_40_motorcycles) AS over_40_bike_sale -- Calculate the sum of the new column "ordered_over_40_motorcycles" for each order date and name it 'over_40_bike_sale'
FROM 
    main_cte -- Specify the CTE as the source of data for the main query
GROUP BY 
    orderDate; -- Group the results by order date


-- --------------------------------------------------------------------------------------------------------------------------------------------------------

