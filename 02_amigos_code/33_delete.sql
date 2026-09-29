-- ============================================================
-- DELETE DATA
-- ============================================================

## -- DELETE is used to remove rows from a table.

## -- Basic syntax:

-- DELETE FROM table_name
-- WHERE condition;

---

-- 1. DELETE ONE ROW USING PRIMARY KEY

---

## -- Example:

-- DELETE the person whose id is 100.

DELETE FROM person
WHERE id = 100;

## -- PostgreSQL output:

## -- DELETE 1

-- This means 1 row was deleted.

---

-- 2. DELETE MULTIPLE ROWS

---

-- We can delete multiple rows if they match
-- the WHERE condition.

DELETE FROM person
WHERE gender = 'Female'
AND country_of_birth = 'Nigeria';

## -- PostgreSQL might return:

## -- DELETE 5

-- This means 5 rows matched the condition
-- and were deleted.

---

-- 3. RUNNING THE SAME DELETE AGAIN

---

-- If we run the same command again:

DELETE FROM person
WHERE gender = 'Female'
AND country_of_birth = 'Nigeria';

## -- PostgreSQL will return:

## -- DELETE 0

## -- Why?

-- The matching rows were already deleted.
-- There are now no rows matching the condition.

---

-- 4. DELETE USING ONE CONDITION

---

DELETE FROM person
WHERE country_of_birth = 'India';

-- This deletes every person whose
-- country_of_birth is India.

---

-- 5. DELETE USING MULTIPLE CONDITIONS

---

DELETE FROM person
WHERE gender = 'Male'
AND country_of_birth = 'India';

-- Only rows satisfying BOTH conditions are deleted.

---

-- 6. DELETE USING OR

---

DELETE FROM person
WHERE country_of_birth = 'India'
OR country_of_birth = 'China';

-- Rows matching either condition are deleted.

---

-- 7. IMPORTANT: ALWAYS CHECK BEFORE DELETE

---

-- Before deleting, it is a good idea to run
-- the same condition with SELECT first.

SELECT *
FROM person
WHERE gender = 'Female'
AND country_of_birth = 'Nigeria';

-- If the result looks correct, then run:

DELETE FROM person
WHERE gender = 'Female'
AND country_of_birth = 'Nigeria';

-- This is a good habit because DELETE permanently
-- removes the matching rows after the transaction
-- is committed.

---

-- 8. DELETE WITHOUT WHERE

---

## -- WARNING!

-- This deletes ALL rows from the table.

DELETE FROM person;

## -- Example:

## -- Before:

-- id | first_name | country_of_birth
-- ---+------------+-----------------
--  1 | Arun       | India
--  2 | John       | USA
--  3 | David      | Canada
---------------------------

--
-- After:
---------

-- id | first_name | country_of_birth
-- ---+------------+-----------------
--     NO ROWS
--------------

--
-- NEVER run DELETE without WHERE unless
-- you intentionally want to delete every row.

-- ============================================================
-- DELETE vs DROP
-- ============================================================

-- DELETE:
--     Removes rows from a table.
--     The table itself still exists.
-------------------------------------

-- DROP TABLE:
--     Removes the entire table.
--     The table structure is also removed.
-------------------------------------------

--
-- DELETE:
--     DELETE FROM person WHERE id = 1;
---------------------------------------

-- DROP:
--     DROP TABLE person;

-- ============================================================
-- SUMMARY
-- ============================================================

## -- Delete one row:

-- DELETE FROM person
-- WHERE id = 100;
------------------

--
-- Delete multiple rows:
------------------------

-- DELETE FROM person
-- WHERE gender = 'Female'
-- AND country_of_birth = 'Nigeria';
------------------------------------

--
-- Delete all rows:
-------------------

## -- DELETE FROM person;

--
-- IMPORTANT:
-- Always use WHERE when you only want to delete
-- specific rows.
-- ============================================================
