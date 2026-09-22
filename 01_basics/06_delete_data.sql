-- =====================================================
-- DELETE DATA
-- =====================================================


-- Delete products whose name starts with "iphone"
DELETE FROM products
WHERE product_name LIKE 'iphone%';


-- Delete products whose name does not contain "samsung"
DELETE FROM products
WHERE product_name NOT LIKE '%samsung%';


-- Delete all rows from the products table
-- The table itself will remain
TRUNCATE TABLE products;

```
DELETE FROM products
→ Deletes selected rows based on WHERE

TRUNCATE TABLE products
→ Deletes ALL rows from the table
→ The table itself is not deleted
```