-- =====================================================
-- ALTER TABLE
-- =====================================================


-- Rename the backup table to products
ALTER TABLE products_bkp
RENAME TO products;


-- Rename the product_code column to product_id
ALTER TABLE products
RENAME COLUMN product_code TO product_id;


-- Change the data type of product_id to FLOAT
-- USING converts the existing values to FLOAT
ALTER TABLE products
ALTER COLUMN product_id TYPE FLOAT
USING product_id::FLOAT;


-- Display the products table
SELECT *
FROM products;