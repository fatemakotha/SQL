-- Show the sum of all orders on each day
-- A table named Orders has been created with the following columns:
-- ORD_NUM
-- ORD_AMOUNT
-- ADVANCE_AMOUNT
-- ORD_DATE
-- CUST_CODE
-- AGENT_CODE
-- ORD_DESCRIPTION
-- #QUESTION: Display each ord_date and the sum of the ord_amount.

-- ANSWER:
select ORD_DATE, sum(ORD_AMOUNT) as total
from Orders
group by ORD_DATE 