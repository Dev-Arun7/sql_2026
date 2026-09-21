-- =====================================================
-- CREATE TABLE
-- =====================================================


-- Create a table named products
CREATE TABLE products
(
    product_code VARCHAR(25),
    product_name VARCHAR(50),
    price FLOAT,
    released_date DATE
);


-- =====================================================
-- INSERT DATA
-- =====================================================


-- Add the first product
INSERT INTO products (product_code, product_name, price, released_date)
VALUES (1, 'iphone 13', 990.50, '2022-03-22');


-- Add the second product
INSERT INTO products (product_code, product_name, price, released_date)
VALUES (2, 'samsung s23', 1100.50, '2023-03-22');


-- Add the third product
INSERT INTO products (product_code, product_name, price, released_date)
VALUES (3, 'pixel 10', 890.70, '2024-09-13');


-- Add the fourth product
-- TO_DATE() converts text into a DATE
INSERT INTO products (product_code, product_name, price, released_date)
VALUES (4, 'oneplus 12', 799.90, TO_DATE('15-06-2025', 'DD-MM-YYYY'));

