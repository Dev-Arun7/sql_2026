-- ============================================================
-- PRIMARY KEY
-- ============================================================
---------------------------------------------------------------

-- A PRIMARY KEY is used to uniquely identify each row
-- in a table.
--------------

-- A primary key:
-- 1. Must contain unique values.
-- 2. Cannot contain NULL values.
-- 3. A table can have only one primary key.
--------------------------------------------

-- ============================================================

-- ============================================================
-- 1. WHY DO WE NEED A PRIMARY KEY?
-- ============================================================
---------------------------------------------------------------

-- Imagine a table without a primary key.

CREATE TABLE person_without_pk (
id INT,
first_name VARCHAR(50),
last_name VARCHAR(50)
);

-- Insert some data.

INSERT INTO person_without_pk
VALUES (1, 'Arun', 'Kumar');

INSERT INTO person_without_pk
VALUES (1, 'John', 'Smith');

INSERT INTO person_without_pk
VALUES (1, 'David', 'Thomas');

## -- The table now looks like:

-- id | first_name | last_name
-- ---+------------+----------
-- 1  | Arun       | Kumar
-- 1  | John       | Smith
-- 1  | David      | Thomas
---------------------------

--
-- Notice that all three rows have id = 1.
------------------------------------------

## -- Which person is ID 1?

-- We cannot uniquely identify a person using the ID.

-- ============================================================
-- 2. THE SOLUTION: PRIMARY KEY
-- ============================================================
---------------------------------------------------------------

-- We can tell PostgreSQL that the ID must be unique.

CREATE TABLE person (
id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50)
);

-- Insert data.

INSERT INTO person
VALUES (1, 'Arun', 'Kumar');

INSERT INTO person
VALUES (2, 'John', 'Smith');

INSERT INTO person
VALUES (3, 'David', 'Thomas');

## -- The table now looks like:

-- id | first_name | last_name
-- ---+------------+----------
-- 1  | Arun       | Kumar
-- 2  | John       | Smith
-- 3  | David      | Thomas
---------------------------

--
-- Every row has a different ID.
--------------------------------

-- The database now knows that "id" is the PRIMARY KEY.

-- ============================================================
-- 3. DUPLICATE PRIMARY KEY
-- ============================================================
---------------------------------------------------------------

-- Try inserting another row with id = 1.

INSERT INTO person
VALUES (1, 'Michael', 'Thomas');

## -- This will fail.

## -- Why?

## -- ID 1 already exists.

## -- PostgreSQL prevents duplicate primary-key values.

## -- The table remains:

-- id | first_name | last_name
-- ---+------------+----------
-- 1  | Arun       | Kumar
-- 2  | John       | Smith
-- 3  | David      | Thomas

-- ============================================================
-- 4. NULL PRIMARY KEY
-- ============================================================
---------------------------------------------------------------

-- Try inserting NULL as the ID.

INSERT INTO person
VALUES (NULL, 'Robert', 'Brown');

## -- This will also fail.

## -- A PRIMARY KEY cannot contain NULL.

## -- Why?

-- A primary key is used to identify a row.
-- NULL means there is no value / unknown value.
------------------------------------------------

-- Therefore NULL cannot be used as a primary key.

-- ============================================================
-- 5. PRIMARY KEY DOES NOT MAKE EVERY COLUMN UNIQUE
-- ============================================================
---------------------------------------------------------------

## -- The PRIMARY KEY column must be unique.

## -- Other columns do NOT have to be unique.

-- This is allowed:

INSERT INTO person
VALUES (4, 'Arun', 'Kumar');

## -- The table now looks like:

-- id | first_name | last_name
-- ---+------------+----------
-- 1  | Arun       | Kumar
-- 2  | John       | Smith
-- 3  | David      | Thomas
-- 4  | Arun       | Kumar
--------------------------

--
-- "Arun Kumar" appears twice.
------------------------------

## -- This is allowed because the IDs are different.

## -- Therefore:

-- PRIMARY KEY prevents duplicate IDs,
-- NOT duplicate people/data in every column.

-- ============================================================
-- 6. HOW TO CREATE A PRIMARY KEY
-- ============================================================
---------------------------------------------------------------

-- Method 1:
-- Define PRIMARY KEY directly on the column.

CREATE TABLE student (
student_id INT PRIMARY KEY,
name VARCHAR(50)
);

## -- Example table:

-- student_id | name
-- -----------+------
-- 1          | Arun
-- 2          | John
-- 3          | David

-- Method 2:
-- Define PRIMARY KEY separately.

CREATE TABLE employee (
employee_id INT,
name VARCHAR(50),
PRIMARY KEY (employee_id)
);

-- Both methods create a primary key.

-- ============================================================
-- 7. PRIMARY KEY DOES NOT HAVE TO BE CALLED "id"
-- ============================================================
---------------------------------------------------------------

-- The primary-key column can have any suitable name.

CREATE TABLE customer (
customer_id INT PRIMARY KEY,
name VARCHAR(50)
);

## -- Example:

-- customer_id | name
-- ------------+------
-- 1           | Arun
-- 2           | John
-- 3           | David

-- "id" is common, but it is not required.

-- ============================================================
-- 8. CHECK THE PRIMARY KEY
-- ============================================================
---------------------------------------------------------------

## -- In psql, use:

## -- \d person

## -- PostgreSQL will show the primary key information.

## -- You can also use:

-- \d+ person

-- ============================================================
-- 9. PRIMARY KEY AND UPDATE
-- ============================================================
---------------------------------------------------------------

-- A primary key makes it easy to identify a specific row.

UPDATE person
SET first_name = 'Johnathan'
WHERE id = 2;

## -- Before:

-- id | first_name | last_name
-- ---+------------+----------
-- 1  | Arun       | Kumar
-- 2  | John       | Smith
-- 3  | David      | Thomas
-- 4  | Arun       | Kumar
--------------------------

--
-- After:
---------

-- id | first_name | last_name
-- ---+------------+----------
-- 1  | Arun       | Kumar
-- 2  | Johnathan  | Smith
-- 3  | David      | Thomas
-- 4  | Arun       | Kumar

-- ============================================================
-- 10. PRIMARY KEY AND DELETE
-- ============================================================

DELETE FROM person
WHERE id = 3;

## -- Only the row with ID 3 is deleted.

## -- Before:

-- id | first_name | last_name
-- ---+------------+----------
-- 1  | Arun       | Kumar
-- 2  | Johnathan  | Smith
-- 3  | David      | Thomas
-- 4  | Arun       | Kumar
--------------------------

--
-- After:
---------

-- id | first_name | last_name
-- ---+------------+----------
-- 1  | Arun       | Kumar
-- 2  | Johnathan  | Smith
-- 4  | Arun       | Kumar

-- ============================================================
-- 11. WHY PRIMARY KEYS ARE IMPORTANT
-- ============================================================
---------------------------------------------------------------

## -- Without a primary key:

-- id | name
-- ---+------
-- 1  | Arun
-- 1  | John
-- 1  | David
-------------

## -- It becomes difficult to identify a specific row.

--
-- With a primary key:
----------------------

-- id | name
-- ---+------
-- 1  | Arun
-- 2  | John
-- 3  | David
-------------

-- Each row has its own unique identifier.

-- ============================================================
-- 12. PRIMARY KEY WITH BIGSERIAL
-- ============================================================
---------------------------------------------------------------

## -- PostgreSQL can automatically generate ID values.

-- BIGSERIAL creates automatically increasing numbers.

CREATE TABLE person_auto_id (
id BIGSERIAL PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50)
);

-- Insert data without providing the ID.

INSERT INTO person_auto_id (first_name, last_name)
VALUES ('Arun', 'Kumar');

INSERT INTO person_auto_id (first_name, last_name)
VALUES ('John', 'Smith');

INSERT INTO person_auto_id (first_name, last_name)
VALUES ('David', 'Thomas');

## -- PostgreSQL automatically generates the IDs.

## -- The table will look like:

-- id | first_name | last_name
-- ---+------------+----------
-- 1  | Arun       | Kumar
-- 2  | John       | Smith
-- 3  | David      | Thomas

-- ============================================================
-- 13. PRIMARY KEY AND FOREIGN KEY
-- ============================================================
---------------------------------------------------------------

## -- A primary key can be referenced by another table.

## -- Example:

## -- person

-- id | first_name
-- ---+----------
-- 1  | Arun
-- 2  | John
------------

--
-- Another table can store the person's ID.

CREATE TABLE orders (
order_id BIGSERIAL PRIMARY KEY,
person_id BIGINT,
product_name VARCHAR(100)
);

## -- Example:

## -- orders

-- order_id | person_id | product_name
-- ----------+-----------+-------------
-- 1        | 1         | Laptop
-- 2        | 1         | Mouse
-- 3        | 2         | Keyboard
----------------------------------

--
-- Here:
--------

-- order_id  -> PRIMARY KEY
-- person_id -> identifies the person
-------------------------------------

-- Foreign keys will be covered separately.

-- ============================================================
-- 14. COMPOSITE PRIMARY KEY
-- ============================================================
---------------------------------------------------------------

## -- A primary key can contain more than one column.

-- This is called a COMPOSITE PRIMARY KEY.

CREATE TABLE student_course (
student_id INT,
course_id INT,
PRIMARY KEY (student_id, course_id)
);

## -- Example:

-- student_id | course_id
-- ------------+----------
-- 1          | 101
-- 1          | 102
-- 2          | 101
-- 2          | 103
-------------------

--
-- The combination of student_id + course_id must be unique.
------------------------------------------------------------

## -- This is allowed:

-- 1 | 101
-- 1 | 102
----------

## -- because the combinations are different.

--
-- This is NOT allowed:
-----------------------

-- 1 | 101
-- 1 | 101
----------

-- because the complete combination is duplicated.

-- ============================================================
-- 15. PRIMARY KEY VS UNIQUE
-- ============================================================
---------------------------------------------------------------

## -- PRIMARY KEY and UNIQUE both prevent duplicate values.

## -- But they are not exactly the same.

--
-- PRIMARY KEY:
---------------

-- - Uniquely identifies a row.
-- - Cannot contain NULL.
-- - Only one PRIMARY KEY is allowed per table.
-----------------------------------------------

--
-- UNIQUE:
----------

-- - Prevents duplicate values.
-- - Multiple UNIQUE constraints can exist in a table.
------------------------------------------------------

-- UNIQUE will be covered separately.

-- ============================================================
-- 16. IMPORTANT RULES
-- ============================================================
---------------------------------------------------------------

| -- PRIMARY KEY                                  |
| ----------------------------------------------- |
| --     +--> Must be UNIQUE                      |
| --                                              |
| --     +--> Cannot be NULL                      |
| --                                              |
| --     +--> Identifies a row                    |
| --                                              |
| --     +--> Only one PRIMARY KEY per table      |
| --                                              |
| --     +--> Can contain one or multiple columns |
| --                                              |
| --                                              |
| -- Example:                                     |
| --                                              |
| -- CREATE TABLE person (                        |
| --     id INT PRIMARY KEY,                      |
| --     first_name VARCHAR(50)                   |
| -- );                                           |

-- ============================================================
-- SUMMARY
-- ============================================================
---------------------------------------------------------------

## -- PRIMARY KEY = unique identifier for each row.

--
-- Example:
-----------

-- id | name
-- ---+------
-- 1  | Arun
-- 2  | John
-- 3  | David
-------------

--
-- NOT allowed:
---------------

-- id | name
-- ---+------
-- 1  | Arun
-- 1  | John
------------

--
-- Also NOT allowed:
--------------------

-- id | name
-- ---+------
-- NULL | Arun
--------------

--
-- Remember:
------------

| -- PRIMARY KEY                                                  |
| --------------------------------------------------------------- |
| --       +--> UNIQUE                                            |
| --                                                              |
| --       +--> NOT NULL                                          |
| --                                                              |
| --       +--> Identifies each row                               |
| --                                                              |
| -- ============================================================ |
