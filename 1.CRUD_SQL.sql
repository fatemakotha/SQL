--Create a table with name "products".
--Insert the column name and datatype. I.e. column name is id and datatype is integer
--NOT NULL means this column cannot have null values
--Primary key is thw column tha addresses the table. Here the primary key is the id column
CREATE TABLE products (
    id INT NOT NULL,
    name STRING,
    price MONEY,
  	primary key (id)
);

--Display the table
SELECT * FROM products;

--Insert a row into the "products" table
--This table has 3 columns, id, name and price. Insert those in order, into the VALUES
INSERT INTO products
VALUES (1, "Pen", 1.20);

--Insert another row. This time leave a blank for the price VALUE
INSERT INTO products (id, name)
VALUES (2, "Pencil");

--Find out all products with a price of 1.2
SELECT *
FROM products
WHERE price = 1.2;

--Update the null price VALUE in the price column with 0.80 using SET
UPDATE products
SET price = 0.80
WHERE id = 2;

UPDATE products
SET price = 0.7
WHERE id = 2;

--- 22-01-2024 20:09:08
--- SQLite
UPDATE products
SET price = 0.7
WHERE id = 2;

--Add a new column
alter TABLE products
ADD stock INT;

--- 22-01-2024 20:10:40
--- SQLite
SELECT * FROM products;

--Update the stock column with values
UPDATE products
SET stock = 32
WHERE id = 1;

UPDATE products
SET stock = 12
WHERE id = 2;

--Delete a row from the table
DELETE FROM products
WHERE name = "Pencil";

--Add the row again
INSERT INTO products
VALUES (2, "Pencil", 0.8, 12);

--Create a new table "orders", this time include a FOREIGN KEY 
CREATE TABLE orders (
  id INT NOT NULL,
  order_number INT,
  customer_id INT, 
  product_id INT,
  PRIMARY KEY (id), --set as primary key
  FOREIGN KEY (customer_id) REFERENCES customers(id), --foreign key
  FOREIGN KEY (product_id) REFERENCES products(id) --foreign key
  );


--Create a table "customers", set PRIMARY KEY to id
CREATE TABLE customers (
    id INT NOT NULL,
    first_name STRING,
    last_name STRING,
  	address STRING,
  	PRIMARY KEY (id)
);

--Insert rows of VALUES in the "customers" table
INSERT INTO customers
VALUES (1, "Fatema", "Alam", "60 Leigh Road");

INSERT INTO customers
VALUES (2, "Cutu", "Baby", "12 Shekertek");

--Insert rows of VALUES in the "orders" table
INSERT INTO orders
VALUES (1, 4362, 2, 1);


--Make a relationship table by joining the "customers" and the "orders" table
SELECT orders.order_number, customers.first_name, customers.last_name, customers.address
FROM orders --That is the table where we will find the FOREIGN KEY MATCH
--We want to join the customers. And after ON we match the customer_id from orders table column with our primary key in the customers table
INNER JOIN customers ON orders.customer_id = customers.id;


--Make a relationship table by joining the "products" and the "orders" table
SELECT products.name, products.price, products.stock
FROM orders --That is the table where we will find the FOREIGN KEY MATCH
--We want to join the customers. And after ON we match the customer_id from orders table column with our primary key in the customers table
INNER JOIN products ON orders.product_id = products.id;