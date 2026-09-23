-- =====================================================
-- READ DATA
-- =====================================================

-- SELECT is used to read data from a table.

## -- General syntax:

-- SELECT column_name
-- FROM table_name;

-- =====================================================
-- READ ALL COLUMNS
-- =====================================================

-- * means all columns

SELECT *
FROM person;

-- =====================================================
-- READ ONE COLUMN
-- =====================================================

SELECT first_name
FROM person;

-- =====================================================
-- READ MULTIPLE COLUMNS
-- =====================================================

SELECT first_name, email
FROM person;

-- =====================================================
-- NOTES
-- =====================================================

## -- SELECT * -> Read all columns

-- SELECT first_name
-- -> Read only the first_name column
-------------------------------------

-- SELECT first_name, email
-- -> Read only first_name and email
------------------------------------

-- FROM tells PostgreSQL which table to read from.
