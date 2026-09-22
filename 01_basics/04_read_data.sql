-- =====================================================
-- READ DATA
-- =====================================================


-- Read all columns and all products
SELECT *
FROM products;


-- Read only the product name and price
SELECT product_name, price
FROM products;


-- =====================================================
-- WHERE
-- =====================================================


-- Find products with a price greater than 1000
SELECT *
FROM products
WHERE price > 1000;


-- Find only the product names with a price greater than 1000
SELECT product_name
FROM products
WHERE price > 1000;


-- Find a product released on a specific date
SELECT *
FROM products
WHERE released_date = '2022-03-22';


-- =====================================================
-- DATE FUNCTIONS
-- =====================================================


-- Get products released in 2023 using TO_CHAR()
-- TO_CHAR() converts the date into text
SELECT *
FROM products
WHERE TO_CHAR(released_date, 'YYYY') = '2023';


-- Get products released in 2023 using EXTRACT()
-- EXTRACT() gets the year from the date
SELECT *
FROM products
WHERE EXTRACT(YEAR FROM released_date) = 2023;


-- =====================================================
-- ALIAS
-- =====================================================


-- Give product_name a temporary name called my_item
SELECT product_name AS my_item
FROM products
WHERE price > 1000;


-- =====================================================
-- AGGREGATE FUNCTIONS
-- =====================================================


-- Count the total number of products
SELECT COUNT(*)
FROM products;


-- Count products with a price less than 1000
SELECT COUNT(*)
FROM products
WHERE price < 1000;


-- Calculate the total price of all products
SELECT SUM(price)
FROM products;


-- Calculate the average price of all products
SELECT AVG(price)
FROM products;