SELECT *
FROM customers
WHERE contactLastName != "Young";

select customerName, contactFirstName, contactLastName, phone, city, country
from customers
where country = "USA" and contactFirstName = "Julie";

select contactFirstName, contactLastName
from customers
where country = "Norway"
or country = "Sweden"