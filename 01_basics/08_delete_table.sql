-- =====================================================
-- DROP TABLE
-- =====================================================


-- Delete the products table
-- This removes the table and all its data
DROP TABLE products;


-- Delete the products table only if it exists
-- No error will be shown if the table does not exist
DROP TABLE IF EXISTS products;