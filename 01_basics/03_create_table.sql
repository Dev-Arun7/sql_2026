-- =====================================================
-- CREATE TABLE
-- =====================================================

## -- General syntax:

-- CREATE TABLE table_name (
--     column_name data_type,
--     column_name data_type
-- );

-- Example:
CREATE TABLE person (
id INT,
first_name VARCHAR(50),
last_name VARCHAR(50),
gender VARCHAR(7),
date_of_birth DATE
);

-- =====================================================
-- CHECK TABLES
-- =====================================================

-- Show all tables and sequences
\d

-- Show all tables only
\dt

-- Show the structure of a specific table
\d person

-- =====================================================
-- NOTES
-- =====================================================

-- INT        -> Stores whole numbers
-- VARCHAR(n) -> Stores text with a maximum length of n
-- DATE       -> Stores date values
-----------------------------------

-- Example:
-- id INT
-- first_name VARCHAR(50)
-- date_of_birth DATE
---------------------

-- A comma (,) is used between columns.
-- The last column does not need a comma.




-- =====================================================
-- DROP TABLE (Delete the whole Table)
-- =====================================================

-- Delete the table
DROP TABLE person;

-- Check tables again
\d

-- =====================================================
-- NOTES
-- =====================================================

-- DROP TABLE permanently deletes the table and its data.