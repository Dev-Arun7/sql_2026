-- =====================================================
-- PRACTICE PROBLEMS
-- =====================================================

-- Create all the tables first before solving the problems

SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;


-- =====================================================
-- PROBLEM 1
-- =====================================================

-- Identify the total number of products sold

SELECT SUM(quantity)
FROM sales_order;

-- Use an alias
SELECT SUM(quantity) AS total_sold_products
FROM sales_order;


-- =====================================================
-- PROBLEM 2
-- =====================================================

-- Other than 'Completed', display the available delivery status

SELECT status
FROM sales_order
WHERE status != 'Completed';


-- For case-sensitive values
-- This excludes both 'Completed' and 'completed'

SELECT status
FROM sales_order
WHERE status NOT IN ('Completed', 'completed');


-- Another way: convert the status to lowercase

SELECT status
FROM sales_order
WHERE LOWER(status) = 'completed';


-- =====================================================
-- LEARNING NOTE: DISTINCT
-- =====================================================

-- DISTINCT removes duplicate values.
-- This is only for learning and is not part of the problem.

SELECT DISTINCT status
FROM sales_order
WHERE status IN ('Completed', 'completed');