-- =====================================================
-- UPDATE DATA
-- =====================================================


-- Update the price of the iPhone 13
UPDATE products
SET price = 991.20
WHERE product_name = 'iphone 13';


-- Update the price and release date of the iPhone 13
UPDATE products
SET price = 991.30,
    released_date = TO_DATE('2023-08-28', 'YYYY-MM-DD')
WHERE product_name = 'iphone 13';


-- Update the price of products whose name starts with "pixel"
UPDATE products
SET price = 860.20
WHERE product_name LIKE 'pixel%';


-- Update the price of products whose name contains "samsung"
UPDATE products
SET price = 992.20
WHERE product_name LIKE '%samsung%';


-- Check the updated data
SELECT *
FROM products;