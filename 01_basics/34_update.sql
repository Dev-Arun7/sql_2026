-- ============================================================
-- UPDATE DATA
-- ============================================================

## -- UPDATE is used to change existing data in a table.

## -- Basic syntax:

-- UPDATE table_name
-- SET column_name = new_value
-- WHERE condition;

---

-- 1. UPDATE ONE COLUMN

---

-- Change the email of the person with id = 1.

UPDATE person
SET email = 'simba@gmail.com'
WHERE id = 1;

## -- PostgreSQL output:

## -- UPDATE 1

-- This means 1 row was updated.

-- Check the result:

SELECT *
FROM person
WHERE id = 1;

## -- Example:

## -- Before:

-- id | first_name | last_name | email
-- ---+------------+-----------+----------------
--  1 | Britney    | Bagguley  | old@email.com
----------------------------------------------------------------------

--
-- After:
---------

-- id | first_name | last_name | email
-- ---+------------+-----------+-----------------
--  1 | Britney    | Bagguley  | simba@gmail.com

---

-- 2. UPDATE MULTIPLE COLUMNS

---

-- We can update more than one column
-- in the same UPDATE statement.

UPDATE person
SET first_name = 'Simba',
last_name = 'Cat'
WHERE id = 1;

-- Check the result:

SELECT *
FROM person
WHERE id = 1;

## -- Example:

-- id | first_name | last_name | email
-- ---+------------+-----------+-----------------
--  1 | Simba      | Cat       | simba@gmail.com
---

-- 3. UPDATE MULTIPLE ROWS

---

-- UPDATE can change more than one row
-- if multiple rows match the WHERE condition.

UPDATE person
SET gender = 'Male'
WHERE country_of_birth = 'India';

-- Every person born in India will now have
-- gender = 'Male'.

---

-- 4. UPDATE USING MULTIPLE CONDITIONS

---

UPDATE person
SET email = 'example@gmail.com'
WHERE gender = 'Male'
AND country_of_birth = 'India';

-- Only rows matching BOTH conditions are updated.

---

-- 5. UPDATE USING OR

---

UPDATE person
SET email = 'example@gmail.com'
WHERE country_of_birth = 'India'
OR country_of_birth = 'China';

-- Rows matching either condition are updated.

---

-- 6. UPDATE USING CALCULATIONS

---

-- We can also use calculations when updating data.

## -- Example:

-- UPDATE product
-- SET price = price * 1.10
-- WHERE id = 1;
----------------

-- This increases the price by 10%.

---

-- 7. CHECK BEFORE UPDATE

---

-- Before updating data, it is a good habit
-- to check which rows will be affected.

SELECT *
FROM person
WHERE id = 1;

-- Then perform the UPDATE:

UPDATE person
SET email = 'new@email.com'
WHERE id = 1;

-- Check the result again:

SELECT *
FROM person
WHERE id = 1;

---

-- 8. IMPORTANT: UPDATE WITHOUT WHERE

---

## -- WARNING!

-- If WHERE is not used, ALL rows will be updated.

-- Example:

-- UPDATE person
-- SET gender = 'Male';

## -- This would change the gender of EVERY row.

-- Always use WHERE when you only want to
-- update specific rows.

-- ============================================================
-- UPDATE vs INSERT
-- ============================================================

-- INSERT:
--     Adds a new row.
----------------------

-- UPDATE:
--     Changes an existing row.
-------------------------------

--
-- INSERT:
----------

-- INSERT INTO person (...)
-- VALUES (...);
----------------

--
-- UPDATE:
----------

-- UPDATE person
-- SET email = 'example@gmail.com'
-- WHERE id = 1;

-- ============================================================
-- UPDATE vs DELETE
-- ============================================================

-- UPDATE:
--     Changes existing data.
-----------------------------

-- DELETE:
--     Removes existing rows.
-----------------------------

--
-- UPDATE:
----------

-- UPDATE person
-- SET first_name = 'Simba'
-- WHERE id = 1;
----------------

--
-- DELETE:
----------

-- DELETE FROM person
-- WHERE id = 1;

-- ============================================================
-- SUMMARY
-- ============================================================

## -- Update one column:

-- UPDATE person
-- SET email = 'example@gmail.com'
-- WHERE id = 1;
----------------

--
-- Update multiple columns:
---------------------------

-- UPDATE person
-- SET first_name = 'Simba',
--     last_name = 'Cat'
-- WHERE id = 1;
----------------

--
-- IMPORTANT:
-- Always use WHERE when you only want to update
-- specific rows.
-- ============================================================
