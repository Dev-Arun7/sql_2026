-- =====================================================
-- CREATE A BACKUP TABLE
-- =====================================================


-- Create a backup table with the structure and all data
CREATE TABLE products_bkp
AS
SELECT *
FROM products;


-- Create a backup table with only the table structure
-- WHERE 1 = 2 is always false, so no rows are copied
CREATE TABLE products_bkp2
AS
SELECT *
FROM products
WHERE 1 = 2;


-- Check the backup table with data
SELECT *
FROM products_bkp;


-- Check the empty backup table
SELECT *
FROM products_bkp2;