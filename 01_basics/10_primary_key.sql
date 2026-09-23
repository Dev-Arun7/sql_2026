-- =====================================================
-- PRIMARY KEY
-- =====================================================


-- Remove the table if it already exists
DROP TABLE IF EXISTS products;


-- =====================================================
-- PRIMARY KEY DURING TABLE CREATION
-- =====================================================


-- product_code is the primary key
-- A primary key must be unique and cannot be NULL
CREATE TABLE products
(
    product_code INT PRIMARY KEY,
    product_name VARCHAR(50),
    price FLOAT,
    released_date DATE
);


-- Add the first product
INSERT INTO products (product_code, product_name, price, released_date)
VALUES (1, 'iphone 13', 990.50, '2022-03-22');


-- This will NOT work because product_code 1 already exists
INSERT INTO products (product_code, product_name, price, released_date)
VALUES (1, 'iphone 14', 950.50, '2023-03-22');


-- Add the second product
INSERT INTO products (product_code, product_name, price, released_date)
VALUES (2, 'samsung s23', 1100.50, '2023-03-22');


-- Add the third product
INSERT INTO products (product_code, product_name, price, released_date)
VALUES (3, 'pixel 10', 890.70, '2024-09-13');


-- Add the fourth product
INSERT INTO products (product_code, product_name, price, released_date)
VALUES (4, 'oneplus 12', 799.90, TO_DATE('15-06-2025', 'DD-MM-YYYY'));


-- View the products
SELECT *
FROM products;


-- =====================================================
-- PRIMARY KEY USING CONSTRAINT
-- =====================================================


DROP TABLE IF EXISTS products;


-- The primary key is given a name: pk_prod
CREATE TABLE products
(
    product_code INT,
    product_name VARCHAR(50),
    price FLOAT,
    released_date DATE,

    CONSTRAINT pk_prod PRIMARY KEY (product_code)
);


-- =====================================================
-- COMPOSITE PRIMARY KEY
-- =====================================================


DROP TABLE IF EXISTS products;


-- Two columns together form the primary key
CREATE TABLE products
(
    product_code INT,
    product_name VARCHAR(50),
    price FLOAT,
    released_date DATE,

    CONSTRAINT pk_prod PRIMARY KEY (product_code, product_name)
);


-- The combination (1, 'iphone 13') is the primary key
INSERT INTO products (product_code, product_name, price, released_date)
VALUES (1, 'iphone 13', 990.50, '2022-03-22');


-- This will NOT work because the combination
-- (1, 'iphone 13') already exists
INSERT INTO products (product_code, product_name, price, released_date)
VALUES (1, 'iphone 13', 950.50, '2023-03-22');


-- This WILL work because the combination is different
INSERT INTO products (product_code, product_name, price, released_date)
VALUES (1, 'iphone 14', 950.50, '2023-03-22');


-- =====================================================
-- AUTO-INCREMENT PRIMARY KEY
-- =====================================================


DROP TABLE IF EXISTS products;


-- PostgreSQL automatically generates product_code
CREATE TABLE products
(
    product_code INT GENERATED ALWAYS AS IDENTITY,
    product_name VARCHAR(50),
    price FLOAT,
    released_date DATE,

    CONSTRAINT pk_prod PRIMARY KEY (product_code)
);


-- PostgreSQL automatically creates product_code
-- We don't need to provide product_code
INSERT INTO products (product_code, product_name, price, released_date)
VALUES (default, 'iphone 13', 990.50, '2022-03-22');


INSERT INTO products (product_code, product_name, price, released_date)
VALUES (default, 'samsung s23', 1100.50, '2023-03-22');


INSERT INTO products (product_code, product_name, price, released_date)
VALUES (default, 'pixel 10', 890.70, '2024-09-13');


INSERT INTO products (product_code, product_name, price, released_date)
VALUES (default, 'oneplus 12', 799.90, TO_DATE('15-06-2025', 'DD-MM-YYYY'));


-- View the automatically generated product_code
SELECT *
FROM products;