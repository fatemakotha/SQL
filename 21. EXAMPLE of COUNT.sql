-- QUESTION:
-- Count how many distinct customers there were on each day
-- A table named sales has been created, with 4 columns:
-- orderdate
-- customerkey
-- salesid
-- salesvalue

-- Show a distinct count of each customer key broken down by day. Name the output column as customers.

-- ANSWER:
select orderdate  , COUNT( DISTINCT customerkey) as customers
from sales
group by orderdate;
-- WON'T RUN HERE as this is a practice excercise from the build in course ****