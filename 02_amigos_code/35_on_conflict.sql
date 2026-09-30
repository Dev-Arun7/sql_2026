-- ============================================================
-- ON CONFLICT
-- ============================================================

## -- ON CONFLICT is used with INSERT.

-- It tells PostgreSQL what to do when an INSERT
-- conflicts with a PRIMARY KEY or UNIQUE constraint.
-----------------------------------------------------

## -- A common use is:

## -- ON CONFLICT DO NOTHING

-- This means:
-- If a conflict happens, do not insert the row
-- and do not show an error.

---

-- 1. EXAMPLE TABLE

---

CREATE TABLE person_conflict (
id INT PRIMARY KEY,
name VARCHAR(100)
);

-- Insert some data:

INSERT INTO person_conflict
VALUES (1, 'Arun');

## -- Table:

-- id | name
-- ---+------
--  1 | Arun

---

-- 2. NORMAL INSERT WITH DUPLICATE ID

---

-- id = 1 already exists.

INSERT INTO person_conflict
VALUES (1, 'John');

## -- This gives an error similar to:

## -- ERROR: duplicate key value violates unique constraint

## -- Because id is a PRIMARY KEY.

-- A PRIMARY KEY cannot contain duplicate values.

---

-- 3. ON CONFLICT DO NOTHING

---

-- Instead of getting an error:

INSERT INTO person_conflict
VALUES (1, 'John')
ON CONFLICT DO NOTHING;

## -- PostgreSQL will simply do nothing.

## -- The existing row remains:

-- id | name
-- ---+------
--  1 | Arun

---

-- 4. ON CONFLICT (COLUMN) DO NOTHING

---

-- We can specify which constraint/column
-- we expect the conflict on.

INSERT INTO person_conflict
VALUES (1, 'John')
ON CONFLICT (id) DO NOTHING;

-- Because id is the PRIMARY KEY,
-- PostgreSQL knows that id must be unique.

---

-- 5. ADD A UNIQUE COLUMN

---

CREATE TABLE user_conflict (
id INT PRIMARY KEY,
email VARCHAR(150) UNIQUE
);

-- Insert:

INSERT INTO user_conflict
VALUES (1, 'arun@gmail.com');

-- Try to insert the same email:

INSERT INTO user_conflict
VALUES (2, 'arun@gmail.com');

-- This fails because email is UNIQUE.

---

-- 6. ON CONFLICT WITH UNIQUE COLUMN

---

INSERT INTO user_conflict
VALUES (2, 'arun@gmail.com')
ON CONFLICT (email) DO NOTHING;

## -- This works.

-- The email already exists, so PostgreSQL
-- simply does nothing.

---

-- 7. WHY ON CONFLICT(email) CAN FAIL

---

-- Consider this table:

CREATE TABLE test_user (
id INT PRIMARY KEY,
email VARCHAR(150)
);

## -- email is NOT UNIQUE.

-- Therefore this will NOT work:

-- INSERT INTO test_user
-- VALUES (1, 'arun@gmail.com')
-- ON CONFLICT (email) DO NOTHING;

-- PostgreSQL cannot use email to detect a conflict
-- because email has no UNIQUE constraint.
------------------------------------------

## -- If you want to use:

## -- ON CONFLICT (email)

-- email must have a UNIQUE constraint.

---

-- 8. ADD UNIQUE LATER

---

-- We can add UNIQUE to an existing column.

ALTER TABLE test_user
ADD CONSTRAINT test_user_email_unique UNIQUE (email);

-- Now this can be used:

INSERT INTO test_user
VALUES (1, 'arun@gmail.com](mailto:arun@gmail.com)')
ON CONFLICT (email) DO NOTHING;

---

-- 9. IMPORTANT: TEXT VALUES NEED QUOTES

---

-- Text values must be inside single quotes.

-- Wrong:

-- INSERT INTO person_conflict
-- VALUES (2, Simba);

-- PostgreSQL thinks Simba is a column name.

-- Correct:

INSERT INTO person_conflict
VALUES (2, 'Simba');

---

-- 10. COMMON MISTAKE

---

-- Do NOT put a colon after DO NOTHING.

-- Wrong:

-- ON CONFLICT (id) DO NOTHING:

-- Correct:

-- ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- BASIC SYNTAX
-- ============================================================

-- General:

INSERT INTO table_name (column1, column2)
VALUES (value1, value2)
ON CONFLICT (column1) DO NOTHING;

-- Or, without specifying a column:

INSERT INTO table_name (column1, column2)
VALUES (value1, value2)
ON CONFLICT DO NOTHING;

-- ============================================================
-- IMPORTANT
-- ============================================================

-- ON CONFLICT needs a PRIMARY KEY or UNIQUE constraint
-- when a specific column is given.
-----------------------------------

## -- Example:

-- PRIMARY KEY:
--     id INT PRIMARY KEY
-------------------------

## -- Then:

## -- ON CONFLICT (id) DO NOTHING

--
-- UNIQUE:
--     email VARCHAR(150) UNIQUE
--------------------------------

## -- Then:

-- ON CONFLICT (email) DO NOTHING

-- ============================================================
-- SUMMARY
-- ============================================================

## -- Normal INSERT:

-- INSERT INTO person_conflict
-- VALUES (1, 'John');

## -- INSERT with conflict handling:

-- INSERT INTO person_conflict
-- VALUES (1, 'John')
-- ON CONFLICT (id) DO NOTHING;

## -- If id = 1 already exists:

-- Normal INSERT      -> ERROR
-- ON CONFLICT        -> DO NOTHING
-----------------------------------

--
-- ON CONFLICT (email) only works when email
-- has a UNIQUE constraint.
-- ============================================================
