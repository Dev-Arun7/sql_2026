-- ============================================================
-- JOIN USING
-- ============================================================

-- USING is a shorter way to write a JOIN
-- when both tables have the same column name.

-- ============================================================
-- 1. OUR TABLES
-- ============================================================

## -- person:

-- person_uid | first_name | car_uid
-- -----------+------------+------------------------------------
-- ...        | Fernanda   | 618c13b5-cf07-4ffe-a8ca-eeed1084b11c
-- ...        | John       | 8e574a73-7ce8-45a7-bfb0-6ae59351fd19

## -- car:

-- car_uid                                | make
-- --------------------------------------+------------
-- 618c13b5-cf07-4ffe-a8ca-eeed1084b11c | Land Rover
-- 8e574a73-7ce8-45a7-bfb0-6ae59351fd19 | GMC

## -- Both tables have:

-- car_uid

-- ============================================================
-- 2. JOIN USING
-- ============================================================

SELECT *
FROM person
JOIN car
USING (car_uid);

## -- PostgreSQL automatically joins:

-- person.car_uid = car.car_uid

-- ============================================================
-- 3. SAME JOIN USING ON
-- ============================================================

-- These two queries do the same JOIN.

SELECT *
FROM person
JOIN car
ON person.car_uid = car.car_uid;

SELECT *
FROM person
JOIN car
USING (car_uid);

-- ============================================================
-- 4. IMPORTANT DIFFERENCE
-- ============================================================

-- With ON:

SELECT *
FROM person
JOIN car
ON person.car_uid = car.car_uid;

-- The common column can appear from both tables.

-- With USING:

SELECT *
FROM person
JOIN car
USING (car_uid);

-- The common column is returned only once.

-- ============================================================
-- 5. WHEN CAN WE USE USING?
-- ============================================================

-- Both tables must have a column with the same name.

## -- Example:

-- person.car_uid
-- car.car_uid
--------------

## -- So we can use:

-- USING (car_uid)

-- If the column names are different:

-- person.car_id
-- car.id
---------

-- We must use ON:

SELECT *
FROM person
JOIN car
ON person.car_id = car.id;

-- ============================================================
-- SUMMARY
-- ============================================================

-- ON:
--   Used when joining columns can have different names.
--------------------------------------------------------

-- USING:
--   Used when both tables have the same column name.
-----------------------------------------------------

## -- Example:

-- JOIN car
-- USING (car_uid)
------------------

## -- is the shorter form of:

-- JOIN car
-- ON person.car_uid = car.car_uid
::
