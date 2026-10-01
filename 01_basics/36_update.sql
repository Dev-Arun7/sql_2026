-- ============================================================
-- ON CONFLICT DO UPDATE
-- ============================================================

## -- ON CONFLICT can do more than just DO NOTHING.

-- We can also update the existing row when
-- a conflict happens.
----------------------

## -- This is useful when we want to:

-- 1. Insert a new row if it does not exist.
-- 2. Update the row if it already exists.
------------------------------------------

## -- Basic syntax:

-- INSERT INTO table_name (...)
-- VALUES (...)
-- ON CONFLICT (column_name)
-- DO UPDATE SET column_name = EXCLUDED.column_name;

---

-- 1. OUR TABLE

---

## -- We are using the person table.

-- Important:
-- id is the PRIMARY KEY.
-------------------------

-- Therefore, two rows cannot have the same id.

-- Check the table:

SELECT *
FROM person
WHERE id = 1;

## -- Example:

-- id | first_name | last_name | email
-- ---+------------+-----------+-------------------
--  1 | Simba      | Cat       | simba@gmail.com

---

-- 2. NORMAL INSERT WITH EXISTING ID

---

-- id = 1 already exists.

INSERT INTO person (
id,
first_name,
last_name,
email,
gender,
date_of_birth,
country_of_birth
)
VALUES (
1,
'Simba',
'Cat',
'simbacat@gmail.com',
'Female',
DATE '2023-11-03',
'China'
);

-- This gives a duplicate key error because
-- id = 1 already exists.

---

-- 3. DO UPDATE

---

-- Instead of showing an error, we can update
-- the existing row.

INSERT INTO person (
id,
first_name,
last_name,
email,
gender,
date_of_birth,
country_of_birth
)
VALUES (
1,
'Simba',
'Cat',
'simbacat@gmail.com', -- Cahnge: simba to simbacat 
'Female',
DATE '2023-11-03',
'China'
)
ON CONFLICT (id)
DO UPDATE SET
email = EXCLUDED.email;

-- Because id = 1 already exists,
-- PostgreSQL updates the email of that row.

---

-- 4. WHAT IS EXCLUDED?

---

-- EXCLUDED represents the NEW values
-- that we tried to insert.
---------------------------

## -- In the example:

## -- email = 'simbacat@gmail.com'

## -- EXCLUDED.email means:

## -- "the email value from the INSERT statement"

-- It does NOT mean the existing email.

---

-- 5. UPDATE MULTIPLE COLUMNS

---

INSERT INTO person (
id,
first_name,
last_name,
email,
gender,
date_of_birth,
country_of_birth
)
VALUES (
1,
'Simba Queen',
'The Cat',
'simbacat@gmail.com',
'Female',
DATE '2023-11-03',
'China'
)
ON CONFLICT (id)
DO UPDATE SET
email = EXCLUDED.email,
last_name = EXCLUDED.last_name,
first_name = EXCLUDED.first_name;

-- The existing row with id = 1 is updated.

---

-- 6. CHECK THE RESULT

---

SELECT *
FROM person
WHERE id = 1;

-- The row now contains the values from
-- the new INSERT statement.

-- ============================================================
-- DO NOTHING vs DO UPDATE
-- ============================================================

## -- DO NOTHING:

## -- If a conflict happens, ignore the INSERT.

-- ON CONFLICT (id)
-- DO NOTHING;

## -- DO UPDATE:

## -- If a conflict happens, update the existing row.

-- ON CONFLICT (id)
-- DO UPDATE SET
--     email = EXCLUDED.email;

-- ============================================================
-- SIMPLE REAL-WORLD IDEA
-- ============================================================

## -- Imagine a user with id = 1 already exists.

## -- We receive new information:

-- id = 1
-- email = 'new@email.com'
--------------------------------------------------

-- We can write:

INSERT INTO person (
id,
first_name,
last_name,
email,
gender,
date_of_birth,
country_of_birth
)
VALUES (
1,
'Simba',
'Cat',
'new@email.com',
'Female',
DATE '2023-11-03',
'China'
)
ON CONFLICT (id)
DO UPDATE SET
email = EXCLUDED.email;

-- If id = 1 does not exist:
--     A new row is inserted.
-----------------------------

-- If id = 1 already exists:
--     The existing email is updated.

-- ============================================================
-- BASIC SYNTAX
-- ============================================================

INSERT INTO table_name (...)
VALUES (...)
ON CONFLICT (column_name)
DO UPDATE SET
column_name = EXCLUDED.column_name;

-- ============================================================
-- SUMMARY
-- ============================================================

-- ON CONFLICT DO NOTHING
--     Ignore the INSERT when a conflict happens.
-------------------------------------------------

--
-- ON CONFLICT DO UPDATE
--     Update the existing row when a conflict happens.
-------------------------------------------------------

--
-- EXCLUDED
--     Represents the new value from the INSERT.
------------------------------------------------

--
-- Example:
-----------

-- ON CONFLICT (id)
-- DO UPDATE SET
--     email = EXCLUDED.email;
------------------------------

## -- This means:

-- "If id already exists, update the existing
-- row's email using the new email value."
-- ============================================================
