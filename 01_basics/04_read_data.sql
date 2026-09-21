
-- =====================================================
-- SELECT DATA
-- =====================================================


-- Read all columns and all rows
SELECT * FROM products;


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