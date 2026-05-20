-- --------------------------------------------------------------------------------------------------------------
-- SQL ASSIGNMENT 1
-- Marks: 30
-- Objective: Understand and apply basic SQL operations
-- Please write your code neatly under each task and submit this script (.sql) file. do not submit anything else. Good luck!
-- --------------------------------------------------------------------------------------------------------------

-- ------------------------------------------------------------------
-- SETTING UP DATABASE (1 mark each)
-- ------------------------------------------------------------------

-- 1. Create a database/schema named "assignmentDB"

CREATE DATABASE assignmentDB;


-- 2. Select the "assignmentDB" database/schema for use.

USE assignmentDB;


-- NOTE: While creating the tables, look at the rows you have to insert later and decide the column datatypes accordingly

-- 3. Create a table named "orders" with the following columns:
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    sales INT
);




-- 4. Create a table named "customers" with the following columns:
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    location VARCHAR(50)
);




-- 5. Create a table named "products" with the following columns:
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50)
);

-- 6. Insert the following rows into the customers table:
INSERT INTO customers VALUES
(1, 'Ahmed', 'Lahore'),
(2, 'Ayesha', 'Karachi'),
(3, 'Bilal', 'Islamabad'),
(4, 'Fatima', 'Faisalabad'),
(5, 'Daniyal', 'Rawalpindi'),
(6, 'Hafsa', 'Peshawar'),
(7, 'Usman', 'Quetta'),
(8, 'Zainab', 'Multan'),
(9, 'Hamza', 'Sialkot'),
(10, 'Mariam', 'Hyderabad');

    

-- 7. Insert the following rows into the products table:

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics'),
(102, 'Mobile Phone', 'Electronics'),
(103, 'Office Chair', 'Furniture'),
(104, 'Dining Table', 'Furniture'),
(105, 'Wireless Headphones', 'Electronics'),
(106, 'LED Monitor', 'Electronics'),
(107, 'Sports Shoes', 'Fashion'),
(108, 'Casual Shirt', 'Fashion'),
(109, 'School Bag', 'Accessories'),
(110, 'Wrist Watch', 'Accessories');




-- 8. Insert the following rows into the orders table:

INSERT INTO orders VALUES
(1001, 1, 101, 1, 1200),
(1002, 2, 102, 2, 1500),
(1003, 3, 103, 4, 6000),
(1004, 4, 104, 1, 1500),
(1005, 5, 105, 3, 4500),
(1006, 6, 106, 2, 7000),
(1007, 7, 107, 1, 8000),
(1008, 8, 108, 5, 1000),
(1009, 9, 109, 2, 1500),
(1010, 10, 110, 1, 2000);


-- ------------------------------------------------------------------
-- EDITING DATABASE (2 + 2 + 4)
-- ------------------------------------------------------------------

-- 1. Change the location of customer id 6 to Lahore
UPDATE customers
SET location = 'Lahore'
WHERE customer_id = 6;


-- 2. Delete the record for customer id 10

DELETE FROM customers
WHERE customer_id = 10;

-- 3. Add a column called location_code to customers and update it with the first three letters from location

ALTER TABLE customers
ADD location_code VARCHAR(3);

UPDATE customers
SET location_code = LEFT(location,3)
WHERE customer_id > 0;

SELECT customer_id, location, location_code
FROM customers;
-- ------------------------------------------------------------------
-- QUERYING (2 marks each)
-- ------------------------------------------------------------------

-- 1. Show only order_id, product_id and quantity columns for all the orders
SELECT order_id, product_id, quantity
FROM orders;


-- 2. Get customer records for customers from Lahore only (all columns).

SELECT *
FROM customers
WHERE location = 'Lahore';

-- 3. Retrieve products just from the electronics category (all columns). Return the results sorted by product's name in ascending order. 

SELECT *
FROM products
WHERE category = 'Electronics'
ORDER BY name ASC;

-- 4. Retrieve customer_id, product_id and sales for orders where sales are greater than 5000. 

SELECT customer_id, product_id, sales
FROM orders
WHERE sales > 5000;


-- 5. Retrieve customer_id, product_id and sales for orders where sales are between 1500 and 5000. Return the results ordered by sales in descending order.

SELECT customer_id, product_id, sales
FROM orders
WHERE sales BETWEEN 1500 AND 5000
ORDER BY sales DESC;

-- 6. Show only the top 3 most expensive orders (all columns)

SELECT *
FROM orders
ORDER BY sales DESC
LIMIT 3;

-- 7. Among orders with a value greater than 1500, show order_id, customer_id, product and sales for the 2 least expensive orders.

SELECT o.order_id, o.customer_id, p.name AS product, o.sales
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE o.sales > 1500
ORDER BY o.sales ASC
LIMIT 2;


