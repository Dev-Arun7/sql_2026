-- ============================================================
-- CHECK CONSTRAINT
-- ============================================================

-- A CHECK constraint is used to make sure that
-- inserted or updated data follows a condition.
------------------------------------------------

-- Example:
-- age must be 18 or greater
-- price must be greater than 0
-- gender must be Male or Female

---

-- 1. CREATE TABLE WITH CHECK

---

CREATE TABLE person_check (
id INT PRIMARY KEY,
first_name VARCHAR(50),
age INT CHECK (age >= 18)
);

---

-- 2. INSERT VALID DATA

---

INSERT INTO person_check
VALUES (1, 'Arun', 33);

INSERT INTO person_check
VALUES (2, 'John', 25);

## -- Table:

-- id | first_name | age
-- ---+------------+----
--  1 | Arun       | 33
--  2 | John       | 25

---

-- 3. INSERT INVALID DATA

---

-- This will fail because age is less than 18.

INSERT INTO person_check
VALUES (3, 'David', 15);

## -- PostgreSQL will give an error similar to:

-- ERROR: new row for relation "person_check"
-- violates check constraint

-- The row is NOT inserted.

---

-- 4. ANOTHER CHECK EXAMPLE

---

CREATE TABLE product_check (
id INT PRIMARY KEY,
name VARCHAR(100),
price NUMERIC CHECK (price > 0)
);

-- Valid:

INSERT INTO product_check
VALUES (1, 'Laptop', 50000);

-- Invalid:

INSERT INTO product_check
VALUES (2, 'Mouse', -500);

## -- The second INSERT fails because:

## -- price > 0

-- -500 does not satisfy the condition.

---

-- 5. CHECK WITH TEXT

---

CREATE TABLE person_gender (
id INT PRIMARY KEY,
first_name VARCHAR(50),
gender VARCHAR(20) CHECK (gender IN ('Male', 'Female'))
);

-- Valid:

INSERT INTO person_gender
VALUES (1, 'Arun', 'Male');

INSERT INTO person_gender
VALUES (2, 'Anne', 'Female');

-- Invalid:

INSERT INTO person_gender
VALUES (3, 'John', 'Other');

-- The INSERT fails because "Other" is not
-- included in the CHECK condition.

---

-- 6. NAMING A CHECK CONSTRAINT

---

-- We can give the CHECK constraint a name.

CREATE TABLE employee_check (
id INT PRIMARY KEY,
name VARCHAR(100),
salary NUMERIC,
CONSTRAINT salary_check CHECK (salary > 0)
);

-- Naming constraints is useful because PostgreSQL
-- can show the constraint name when an error occurs.

---

-- 7. ADD CHECK TO AN EXISTING TABLE

---

-- We can add a CHECK constraint after
-- creating the table.

CREATE TABLE employee (
id INT PRIMARY KEY,
name VARCHAR(100),
salary NUMERIC
);

-- Add the CHECK constraint:

ALTER TABLE employee
ADD CONSTRAINT salary_check
CHECK (salary > 0);

-- Now salary must be greater than 0.

---

-- 8. TEST THE ALTER TABLE CHECK

---

-- Valid:

INSERT INTO employee
VALUES (1, 'Arun', 50000);

-- Invalid:

INSERT INTO employee
VALUES (2, 'John', -1000);

## -- The second INSERT fails because:

## -- salary > 0

-- -1000 does not satisfy the condition.

---

-- 9. CHECK MULTIPLE CONDITIONS

---

CREATE TABLE employee_details (
id INT PRIMARY KEY,
name VARCHAR(100),
age INT,
salary NUMERIC,

CHECK (age >= 18),
CHECK (salary > 0)

);

-- Both conditions must be satisfied.

-- Valid:

INSERT INTO employee_details
VALUES (1, 'Arun', 33, 50000);

-- Invalid because age is less than 18:

INSERT INTO employee_details
VALUES (2, 'John', 16, 30000);

-- Invalid because salary is negative:

INSERT INTO employee_details
VALUES (3, 'David', 25, -5000);

---

-- 10. CHECK USING AND

---

CREATE TABLE product (
id INT PRIMARY KEY,
name VARCHAR(100),
price NUMERIC,
quantity INT,

CHECK (price > 0 AND quantity >= 0)

);

-- Valid:

INSERT INTO product
VALUES (1, 'Laptop', 50000, 10);

-- Invalid:

INSERT INTO product
VALUES (2, 'Mouse', -500, 10);

-- Invalid:

INSERT INTO product
VALUES (3, 'Keyboard', 1000, -5);

-- Both conditions must be satisfied.

-- ============================================================
-- ALTER TABLE: IMPORTANT EXAMPLE
-- ============================================================

-- Suppose we already have this table:

CREATE TABLE student (
id INT PRIMARY KEY,
name VARCHAR(100),
age INT
);

-- We can add the CHECK constraint later:

ALTER TABLE student
ADD CONSTRAINT student_age_check
CHECK (age >= 18);

-- Now PostgreSQL will prevent ages below 18.

---

-- VIEW THE TABLE STRUCTURE

---

-- In psql:

\d student

-- You can see the CHECK constraint in the table definition.

-- ============================================================
-- IMPORTANT NOTE
-- ============================================================

## -- CHECK validates data.

## -- Example:

## -- CHECK (age >= 18)

-- Means:
--     age 18  -> allowed
--     age 25  -> allowed
--     age 17  -> NOT allowed
--     age 10  -> NOT allowed
-----------------------------

-- CHECK does NOT automatically make a column:
--     UNIQUE
--     PRIMARY KEY
--     NOT NULL
---------------

-- Each constraint has a different purpose.

-- ============================================================
-- SUMMARY
-- ============================================================

-- PRIMARY KEY
--     Identifies each row.
--     Unique + NOT NULL.
-------------------------

-- UNIQUE
--     Prevents duplicate values.
---------------------------------

-- NOT NULL
--     Prevents NULL values.
----------------------------

-- CHECK
--     Makes sure data follows a condition.
-------------------------------------------

## -- Examples:

-- CHECK (age >= 18)
-- CHECK (price > 0)
-- CHECK (quantity >= 0)
-- CHECK (gender IN ('Male', 'Female'))
---------------------------------------

## -- Add CHECK later:

-- ALTER TABLE table_name
-- ADD CONSTRAINT constraint_name
-- CHECK (condition);
-- ============================================================
