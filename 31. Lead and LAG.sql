							    /*LAG*/
        
# START: Lead is used to access data in the next row of ordered output.
#	- The syntax is similar to row_number and looks like this:
#	- Lets look at this example:
# LEAD expression
								#Syntax:
	/***LEAD(column_name) OVER (PARTITION BY column_name ORDER BY column_name) END: ***/

SELECT customernumber,
paymentdate,
amount,
lead(amount) over (partition by customernumber order by
paymentdate) as next_payment
FROM classicmodels.payments;
/*----------        ----------        ----------        ----------        ----------*/
	# We see all last payments for a single 'customernumber' will always be NULL
		 #because there are NO NET PAYMENTS:
                         #OUTPUT:        
--   customernumber,  paymentdate,    amount,      next_payment
--    '103',        '2003-06-05',   '14571.44',    '6066.78'
--    '103',        '2004-10-19',  '6066.78',      '1676.14'
--    '103',        '2004-12-18',  '1676.14',      NULL
--    '112',        '2003-06-06',  '32641.98',    '33347.88'
--    '112',        '2004-08-20',  '33347.88',    '14191.12'
--    '112',        '2004-12-17',  '14191.12',    NULL
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

								/*LAG*/
#Lag is used to access data in the previous row of ordered output.
#	- The syntax is similar to row_number and looks like this:
#	- Lets look at this example:
                                #Syntax:
/*LAG(column_name) OVER (PARTITION BY column_name ORDER BY column_name)*/
SELECT customernumber,
paymentdate,
amount,
lag(amount) over (partition by customernumber order by paymentdate) as previous_payment
FROM classicmodels.payments;
/*----------        ----------        ----------        ----------        ----------*/
                         #OUTPUT:      
		-- All NULL values will be in the first row for each customer
--   customernumber,  paymentdate,    amount,      previous_payment
-- 		'398',       '2005-05-18',  '615.45',     '33967.73'
-- 		'381',       '2003-08-22',  '1128.20',    '1627.56'
-- 		'121',        '2003-10-28', '1491.38',    '50218.95'
-- 		'381',        '2003-04-19', '1627.56',     NULL
-- 		'103',        '2004-12-18', '1676.14', '  6066.78'
-- 		'456',        '2004-04-30', '1679.92', 	  NULL
-- 		'350',        '2005-01-29', '1834.56',   '18888.31'
-- 		'172',        '2004-09-09', '1960.80',   '33383.14'
-- 		'161',        '2004-11-14', '2434.25',   '50743.65'
-- 		'148',        '2004-08-11', '2611.84',   '105743.00'
-- 		'323',        '2003-07-05', '2880.00',   NULL
-- 		'216',        '2003-05-09', '3101.40',   NULL
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
							#ANOTHER EXAMPLE:
-- So we actually need to create a column, but we cannot, unless its been **CALCULATED
-- Thus we need to make this a CTE first (or a subquery)**
with cte_main as
(
SELECT customernumber,
paymentdate,
amount,
lag(amount) over (partition by customernumber order by paymentdate) as prev_payment
FROM classicmodels.payments)
-- Now we will calculate and *amount* minus (-) *prev_paument*
select *, amount - prev_payment as difference
from cte_main

/*----------        ----------        ----------        ----------        ----------*/
									#OUTPUT:
				-- Now we can see the amounts, prev_payments and the difference:
                -- For '-21912.25' means that its 21912.25 dollars than the prev_payment:
-- customernumber, paymentdate,   amount,   prev_payment,   difference
-- '496',         '2003-07-16', '32077.44',   NULL,         NULL
-- '496',         '2004-12-31', '52166.00',  '32077.44',   '20088.56'
-- '496',         '2005-05-25', '30253.75',  '52166.00',   '-21912.25'
-- '495',         '2003-12-26', '59265.14',   NULL, 			NULL
-- '495',         '2004-05-14', '6276.60',   '59265.14',   '-52988.54'
-- '489',         '2003-12-04', '22275.73',   NULL, 			NULL
-- '489',         '2004-01-31', '7310.42',   '22275.73',   '-14965.31'
-- '487',         '2003-09-28', '29997.09',   NULL, 			NULL
-- '487',         '2004-02-29', '12573.28',  '29997.09',   '-17423.81'


