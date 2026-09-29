-- ============================================================
-- UNIQUE CONSTRAINT
-- ============================================================

-- A UNIQUE constraint prevents duplicate values
-- in a column.

-- Example:
-- Two people should not have the same email address.

---

-- 1. CREATE TABLE WITH UNIQUE

---

CREATE TABLE person_unique (
id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100) UNIQUE
);

---

-- 2. INSERT DATA

---

INSERT INTO person_unique
VALUES (1, 'Arun', 'Kumar', 'arun@gmail.com');

INSERT INTO person_unique
VALUES (2, 'John', 'Smith', 'john@gmail.com');

## -- Table:

-- id | first_name | last_name | email
-- ---+------------+-----------+-----------------
--  1 | Arun       | Kumar     | arun@gmail.com
--  2 | John       | Smith     | john@gmail.com

---

-- 3. DUPLICATE VALUE

---

-- This will fail because arun@gmail.com
-- already exists.

INSERT INTO person_unique
VALUES (3, 'David', 'Thomas', 'arun@gmail.com');

## -- PostgreSQL will give an error similar to:

## -- ERROR: duplicate key value violates unique constraint

-- The row is NOT inserted.

---

-- 4. DIFFERENT EMAIL IS ALLOWED

---

INSERT INTO person_unique
VALUES (3, 'David', 'Thomas', 'david@gmail.com');

## -- Table:

-- id | first_name | last_name | email
-- ---+------------+-----------+-----------------
--  1 | Arun       | Kumar     | arun@gmail.com
--  2 | John       | Smith     | john@gmail.com
--  3 | David      | Thomas    | david@gmail.com

---

-- 5. UNIQUE ALLOWS NULL

---

-- NULL means the email is not known/provided.
-- UNIQUE does not normally consider NULL values
-- to be duplicate values.

INSERT INTO person_unique
VALUES (4, 'Anne', 'Thomas', NULL);

-- Another NULL is also allowed.

INSERT INTO person_unique
VALUES (5, 'Michael', 'Jones', NULL);

## -- Table:

-- id | first_name | last_name | email
-- ---+------------+-----------+-----------------
--  1 | Arun       | Kumar     | arun@gmail.com
--  2 | John       | Smith     | john@gmail.com
--  3 | David      | Thomas    | david@gmail.com
--  4 | Anne       | Thomas    | NULL
--  5 | Michael    | Jones     | NULL

---

-- 6. UNIQUE ON MULTIPLE COLUMNS

---

-- We can also create a UNIQUE constraint
-- using multiple columns.

CREATE TABLE student_course (
student_id INT,
course_id INT,
UNIQUE (student_id, course_id)
);

## -- The combination must be unique.

-- student_id | course_id
-- ------------+----------
--      1     |    101
--      1     |    102
--      2     |    101
----------------------

-- This is allowed because every combination is different.

## -- This is NOT allowed:

-- student_id | course_id
-- ------------+----------
--      1     |    101
--      1     |    101
----------------------

-- The combination (1, 101) is duplicated.

---

-- 7. ADD UNIQUE TO AN EXISTING TABLE

---

-- We can add a UNIQUE constraint later.

ALTER TABLE person_unique
ADD CONSTRAINT unique_email UNIQUE (email);

-- NOTE:
-- Do not run this command on person_unique as written
-- because email is ALREADY UNIQUE in the table definition.
-----------------------------------------------------------

-- This is only an example of the syntax.

---

-- PRIMARY KEY vs UNIQUE

---

-- PRIMARY KEY
-- 1. Values must be unique
-- 2. NULL is NOT allowed
-- 3. Only one primary key per table
-- 4. Usually identifies the row
--------------------------------

-- UNIQUE
-- 1. Values must be unique
-- 2. NULL is allowed
-- 3. A table can have multiple UNIQUE constraints
-- 4. Usually used for values that should not be duplicated
-----------------------------------------------------------

## -- Example:

-- id    -> PRIMARY KEY
-- email -> UNIQUE

---

-- SIMPLE EXAMPLE

---

CREATE TABLE users (
id BIGSERIAL PRIMARY KEY,
username VARCHAR(50) UNIQUE,
email VARCHAR(100) UNIQUE
);

## -- Here:

-- id       -> identifies the user
-- username -> cannot be duplicated
-- email    -> cannot be duplicated
-----------------------------------

## -- Example table:

-- id | username | email
-- ---+----------+-----------------
--  1 | arun     | arun@gmail.com
--  2 | john     | john@gmail.com
----------------------------------------------------------

## -- This is NOT allowed:

## -- 3 | arun | david@gmail.com

-- because username "arun" already exists.

-- ============================================================
-- SUMMARY
-- ============================================================

-- PRIMARY KEY
--     Unique + NOT NULL
--     Used to identify a row.
------------------------------

-- UNIQUE
--     Prevents duplicate values.
--     NULL is allowed.
--     Multiple UNIQUE constraints can exist.
---------------------------------------------

## -- Common example:

-- id       -> PRIMARY KEY
-- email    -> UNIQUE
-- username -> UNIQUE
-- ============================================================
