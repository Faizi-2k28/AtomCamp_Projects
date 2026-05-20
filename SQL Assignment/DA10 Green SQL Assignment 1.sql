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




-- 2. Select the "assignmentDB" database/schema for use.




-- NOTE: While creating the tables, look at the rows you have to insert later and decide the column datatypes accordingly

-- 3. Create a table named "orders" with the following columns:
-- order_id  (Primary Key)
-- customer_id
-- product_id
-- quantity
-- sales




-- 4. Create a table named "customers" with the following columns:
-- customer_id  (Primary Key)
-- name
-- location 




-- 5. Create a table named "products" with the following columns:
-- product_id   (Primary Key)
-- name
-- category




-- 6. Insert the following rows into the customers table:


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



-- 2. Delete the record for customer id 10



-- 3. Add a column called location_code to customers and update it with the first three letters from location




-- ------------------------------------------------------------------
-- QUERYING (2 marks each)
-- ------------------------------------------------------------------

-- 1. Show only order_id, product_id and quantity columns for all the orders



-- 2. Get customer records for customers from Lahore only (all columns).



-- 3. Retrieve products just from the electronics category (all columns). Return the results sorted by product's name in ascending order. 



-- 4. Retrieve customer_id, product_id and sales for orders where sales are greater than 5000. 



-- 5. Retrieve customer_id, product_id and sales for orders where sales are between 1500 and 5000. Return the results ordered by sales in descending order.



-- 6. Show only the top 3 most expensive orders (all columns)



-- 7. Among orders with a value greater than 1500, show order_id, customer_id, product and sales for the 2 least expensive orders.




