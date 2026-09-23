-- =====================================================
-- FOREIGN KEY
-- =====================================================

-- Remove the tables if they already exist
DROP TABLE IF EXISTS sales_order;
DROP TABLE IF EXISTS products;


-- =====================================================
-- PRODUCTS TABLE
-- =====================================================

CREATE TABLE products
(
    product_code INT PRIMARY KEY,
    product_name VARCHAR(50),
    price FLOAT,
    released_date DATE
);


-- Add products
INSERT INTO products (product_code, product_name, price, released_date)
VALUES (1, 'iphone 13', 990.50, '2022-03-22');

INSERT INTO products (product_code, product_name, price, released_date)
VALUES (2, 'samsung s23', 1100.50, '2023-03-22');

INSERT INTO products (product_code, product_name, price, released_date)
VALUES (3, 'pixel 10', 890.70, '2024-09-13');


-- =====================================================
-- SALES ORDER TABLE
-- =====================================================

CREATE TABLE sales_order
(
    order_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_date DATE,
    quantity INT,
    prod_id INT REFERENCES products(product_code),
    status VARCHAR(30)
);


-- =====================================================
-- INSERT SALES ORDERS
-- =====================================================

INSERT INTO sales_order (order_date, quantity, prod_id, status)
VALUES (TO_DATE('01-01-2025', 'DD-MM-YYYY'), 2, 1, 'Completed');

INSERT INTO sales_order (order_date, quantity, prod_id, status)
VALUES (TO_DATE('01-01-2025', 'DD-MM-YYYY'), 1, 2, 'Pending');

INSERT INTO sales_order (order_date, quantity, prod_id, status)
VALUES (TO_DATE('01-01-2025', 'DD-MM-YYYY'), 1, 3, 'Completed');


-- =====================================================
-- TEST FOREIGN KEY
-- =====================================================

-- This will NOT work because product_code 10
-- does not exist in the products table
INSERT INTO sales_order (order_date, quantity, prod_id, status)
VALUES (TO_DATE('01-01-2025', 'DD-MM-YYYY'), 1, 10, 'Pending');


-- =====================================================
-- READ DATA
-- =====================================================

SELECT *
FROM products;

SELECT *
FROM sales_order;