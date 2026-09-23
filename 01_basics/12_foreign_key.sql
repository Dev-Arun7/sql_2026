--- These are some table for the problems that we're going to do. So create these tables in the DB

-- =====================================================
-- FOREIGN KEYS
-- =====================================================

-- =====================================================
-- PRODUCTS TABLE
-- =====================================================

DROP TABLE IF EXISTS products;

CREATE TABLE products
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100),
    price FLOAT,
    release_date DATE
);

INSERT INTO products
VALUES (DEFAULT, 'iPhone 15', 800, TO_DATE('22-08-2023', 'DD-MM-YYYY'));

INSERT INTO products
VALUES (DEFAULT, 'Macbook Pro', 2100, TO_DATE('12-10-2022', 'DD-MM-YYYY'));

INSERT INTO products
VALUES (DEFAULT, 'Apple Watch 9', 550, TO_DATE('04-09-2022', 'DD-MM-YYYY'));

INSERT INTO products
VALUES (DEFAULT, 'iPad', 400, TO_DATE('25-08-2020', 'DD-MM-YYYY'));

INSERT INTO products
VALUES (DEFAULT, 'AirPods', 420, TO_DATE('30-03-2024', 'DD-MM-YYYY'));


-- =====================================================
-- CUSTOMERS TABLE
-- =====================================================

DROP TABLE IF EXISTS customers;

CREATE TABLE customers
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(30)
);

INSERT INTO customers
VALUES (DEFAULT, 'Meghan Harley', 'mharley@demo.com');

INSERT INTO customers
VALUES (DEFAULT, 'Rosa Chan', 'rchan@demo.com');

INSERT INTO customers
VALUES (DEFAULT, 'Logan Short', 'lshort@demo.com');

INSERT INTO customers
VALUES (DEFAULT, 'Zaria Duke', 'zduke@demo.com');


-- =====================================================
-- EMPLOYEES TABLE
-- =====================================================

DROP TABLE IF EXISTS employees;

CREATE TABLE employees
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO employees
VALUES (DEFAULT, 'Nina Kumari');

INSERT INTO employees
VALUES (DEFAULT, 'Abrar Khan');

INSERT INTO employees
VALUES (DEFAULT, 'Irene Costa');


-- =====================================================
-- SALES ORDER TABLE
-- =====================================================

DROP TABLE IF EXISTS sales_order;

CREATE TABLE sales_order
(
    order_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_date DATE,
    quantity INT,

    -- Foreign key to products table
    prod_id INT REFERENCES products(id),

    status VARCHAR(20),

    -- Foreign key to customers table
    customer_id INT REFERENCES customers(id),

    emp_id INT,

    -- Foreign key to employees table
    CONSTRAINT fk_so_emp
        FOREIGN KEY (emp_id)
        REFERENCES employees(id)
);


-- =====================================================
-- INSERT SALES ORDERS
-- =====================================================

INSERT INTO sales_order
VALUES (DEFAULT, TO_DATE('01-01-2024', 'DD-MM-YYYY'), 2, 1, 'Completed', 1, 1);

INSERT INTO sales_order
VALUES (DEFAULT, TO_DATE('01-01-2024', 'DD-MM-YYYY'), 3, 1, 'Pending', 2, 2);

INSERT INTO sales_order
VALUES (DEFAULT, TO_DATE('02-01-2024', 'DD-MM-YYYY'), 3, 2, 'Completed', 3, 2);

INSERT INTO sales_order
VALUES (DEFAULT, TO_DATE('03-01-2024', 'DD-MM-YYYY'), 3, 3, 'Completed', 3, 2);

INSERT INTO sales_order
VALUES (DEFAULT, TO_DATE('04-01-2024', 'DD-MM-YYYY'), 1, 1, 'Completed', 3, 2);

INSERT INTO sales_order
VALUES (DEFAULT, TO_DATE('04-01-2024', 'DD-MM-YYYY'), 1, 3, 'Completed', 2, 1);

INSERT INTO sales_order
VALUES (DEFAULT, TO_DATE('04-01-2024', 'DD-MM-YYYY'), 1, 2, 'On Hold', 2, 1);

INSERT INTO sales_order
VALUES (DEFAULT, TO_DATE('05-01-2024', 'DD-MM-YYYY'), 4, 2, 'Rejected', 1, 2);

INSERT INTO sales_order
VALUES (DEFAULT, TO_DATE('06-01-2024', 'DD-MM-YYYY'), 5, 5, 'Completed', 1, 2);

INSERT INTO sales_order
VALUES (DEFAULT, TO_DATE('06-01-2024', 'DD-MM-YYYY'), 1, 1, 'Cancelled', 1, 1);


-- =====================================================
-- READ DATA
-- =====================================================

SELECT *
FROM products;

SELECT *
FROM customers;

SELECT *
FROM employees;

SELECT *
FROM sales_order;