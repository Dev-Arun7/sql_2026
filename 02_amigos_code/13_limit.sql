-- =====================================================
-- LIMIT
-- =====================================================

-- LIMIT controls how many rows are returned.

## -- General syntax:

-- SELECT *
-- FROM table_name
-- LIMIT number;

-- Get only the first 5 rows

SELECT *
FROM person
LIMIT 5;

-- LIMIT also works when selecting specific columns

SELECT first_name
FROM person
LIMIT 5;

-- =====================================================
-- OFFSET
-- =====================================================

-- OFFSET skips a number of rows before returning data.

## -- General syntax:

-- SELECT *
-- FROM table_name
-- OFFSET number;

-- Skip the first 3 rows and return the remaining rows

SELECT *
FROM person
OFFSET 3;

-- =====================================================
-- OFFSET + LIMIT
-- =====================================================

-- Skip the first 3 rows
-- and return the next 5 rows.

SELECT *
FROM person
OFFSET 3
LIMIT 5;

-- =====================================================
-- FETCH
-- =====================================================

-- FETCH can also be used to limit the number of rows.

SELECT *
FROM person
OFFSET 5
FETCH FIRST 5 ROW ONLY;

-- =====================================================
-- NOTES
-- =====================================================

-- LIMIT 5
-- -> Return a maximum of 5 rows.
---------------------------------

-- OFFSET 5
-- -> Skip the first 5 rows.
----------------------------

-- OFFSET 5 LIMIT 5
-- -> Skip 5 rows and then return the next 5 rows.
--------------------------------------------------

## -- LIMIT and OFFSET are useful for pagination.

## -- Example:

-- Page 1 -> OFFSET 0  LIMIT 5
-- Page 2 -> OFFSET 5  LIMIT 5
-- Page 3 -> OFFSET 10 LIMIT 5
