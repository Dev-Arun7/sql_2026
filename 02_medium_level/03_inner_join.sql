-- ============================================================
-- INNER JOIN
-- ============================================================

-- INNER JOIN is used to get related data
-- from two or more tables.
---------------------------

-- It returns only rows where there is
-- a match in both tables.
--------------------------

## -- We will use:

-- person.car_id
--      ↓
-- car.id

---

-- 1. OUR TABLES

---

## -- person:

-- id | first_name | car_id
-- ---+------------+-------
--  3 | John       | NULL
--  1 | Fernanda   | 2
--  2 | Omar       | 1
----------------------

--
-- car:
-------

-- id | make       | model
-- ---+------------+--------
--  1 | Land Rover | Sterling
--  2 | GMC        | Acadia

---

-- 2. BASIC INNER JOIN

---

SELECT *
FROM person
JOIN car
ON person.car_id = car.id;

## -- Result:

-- id | first_name | car_id | id | make       | model
-- ---+------------+--------+----+------------+--------
--  2 | Omar       | 1      | 1  | Land Rover | Sterling
--  1 | Fernanda   | 2      | 2  | GMC        | Acadia
------------------------------------------------------

--
-- John is NOT included because:
--------------------------------

## -- John.car_id = NULL

-- There is no car to match with.

---

-- 3. SELECT ONLY THE COLUMNS WE NEED

---

SELECT
person.first_name,
car.make,
car.model,
car.price
FROM person
JOIN car
ON person.car_id = car.id;

## -- Result:

-- first_name | make       | model    | price
-- ------------+------------+----------+----------
-- Omar       | Land Rover | Sterling | 87665.38
-- Fernanda   | GMC        | Acadia   | 17662.69

---

-- 4. HOW THE JOIN WORKS

---

## -- PostgreSQL compares:

## -- person.car_id = car.id

--
-- Omar:
--------

-- person.car_id = 1
-- car.id        = 1
-- MATCH ✓
----------

--
-- Fernanda:
------------

-- person.car_id = 2
-- car.id        = 2
-- MATCH ✓
----------

--
-- John:
--------

-- person.car_id = NULL
-- car.id        = 1 or 2
-- NO MATCH ✗

---

-- 5. JOIN WITH ALIASES

---

-- Aliases make the query shorter and easier to read.

SELECT
p.first_name,
c.make,
c.model,
c.price
FROM person AS p
JOIN car AS c
ON p.car_id = c.id;

-- We can also write:

SELECT
p.first_name,
c.make,
c.model,
c.price
FROM person p
JOIN car c
ON p.car_id = c.id;

-- p = person
-- c = car

-- ============================================================
-- INNER JOIN = MATCHING ROWS
-- ============================================================

## -- Think of it like this:

## -- person                 car

-- car_id                 id
--   1   ----------------> 1    ✓
--   2   ----------------> 2    ✓
--  NULL                  1/2   ✗
---------------------------------

--
-- INNER JOIN returns only the ✓ matches.

-- ============================================================
-- BASIC SYNTAX
-- ============================================================

SELECT columns
FROM table1
JOIN table2
ON table1.column = table2.column;

-- Example:

SELECT
p.first_name,
c.model
FROM person p
JOIN car c
ON p.car_id = c.id;

-- ============================================================
-- SUMMARY
-- ============================================================

## -- INNER JOIN combines related rows from tables.

## -- It returns only rows where the ON condition matches.

## -- Our relationship:

## -- person.car_id = car.id

## -- John is not returned because he has no car_id.

## -- JOIN and INNER JOIN mean the same thing in PostgreSQL:

## -- JOIN

## -- INNER JOIN

-- Both perform an INNER JOIN.
-- ============================================================
