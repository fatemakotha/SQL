-- #                                                BOILERPLATE:
SELECT *
FROM payments; -- gives : customerNumber, checkNumber, paymentDate, amount
-- ---------------------------------------------------------------------------------------------------------

--              #################################### MAX / MIN ##################################
-- 3A: Find the highest / MAX and lowest / MIN payment recieved on the 9th of December:
SELECT paymentDate, MAX(amount), min(amount)
FROM payments
GROUP BY paymentDate 
-- ** We have to do GROUP BY using 'paymentDate' 
-- because we have the "aggregate functions" called MAX(amount), min(amount)
HAVING paymentDate = '2003-12-09'; 
-- OUTPUT: 
# paymentDate, MAX(amount), min(amount)
# '2003-12-09', '63843.55', '7678.25'

-- ---------------------------------------------------------------------------------------------------------

-- 3B: Find the highest / MAX and lowest / MIN payment recieved on the 9th of December, but this time name the MAX and MIN columns:
SELECT paymentDate, MAX(amount) as highest, min(amount) as lowest
FROM payments
GROUP BY paymentDate -- ** We have to do GROUP BY using 'paymentDate' 
                     -- because we have the "aggregate functions" called MAX(amount), min(amount)
HAVING paymentDate = '2003-12-09'; 
-- OUTPUT: 
--  paymentDate, highest, lowest
-- '2003-12-09', '63843.55', '7678.25'
-- ---------------------------------------------------------------------------------------------------------

--              #################################### AVG ##################################
-- 4A: Show the AVG amount of 'payments' made each day
SELECT paymentDate, AVG(amount) as average
FROM payments
GROUP BY paymentDate; -- ** We have to do GROUP BY using 'paymentDate' 
					  -- because we have the "aggregate functions" called MAX(amount), min(amount)
-- OUTPUT: Shows the daily average:
-- # paymentDate, average
--   '2004-10-19', '6066.780000'
--   '2003-06-05', '14571.440000'
--       "       ,        "        and so on . . . 
-- ---------------------------------------------------------------------------------------------------------
-- 4B: Show the AVG amount of 'payments' made each day but now 'remove the *paymentDate*' and *GROUP BY*:
SELECT AVG(amount) as average
FROM payments;
-- OUTPUT: 
-- # average
--  '32431.645531'
