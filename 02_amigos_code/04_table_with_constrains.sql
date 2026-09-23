-- =====================================================
-- TABLE WITH CONSTRAINTS
-- =====================================================

## -- Why do we need constraints?

-- Constraints are rules applied to table columns.
-- They help prevent invalid or unwanted data.
----------------------------------------------

-- Example:
-- If first_name should always have a value,
-- we can use NOT NULL.
-----------------------

-- If id should be unique for every person,
-- we can use PRIMARY KEY.

-- =====================================================
-- GENERAL SYNTAX
-- =====================================================

-- CREATE TABLE table_name (
--     column_name data_type constraint,
--     column_name data_type constraint
-- );

-- =====================================================
-- COMMON CONSTRAINTS
-- =====================================================

-- NOT NULL
-- The column must have a value.

-- PRIMARY KEY
-- Identifies each row uniquely.
-- A primary key cannot contain NULL values.

-- =====================================================
-- CREATE TABLE
-- =====================================================

CREATE TABLE person (
id BIGSERIAL NOT NULL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
gender VARCHAR(7) NOT NULL,
date_of_birth DATE NOT NULL,
email VARCHAR(150)
);

-- =====================================================
-- CHECK TABLE STRUCTURE
-- =====================================================

-- Show all tables
\d

-- Show the structure of person table
\d person

-- =====================================================
-- DROP TABLE
-- =====================================================

DROP TABLE person;

-- =====================================================
-- NOTES
-- =====================================================

-- BIGSERIAL
-- Automatically generates a new number for each row.
-- It is commonly used for ID columns.
--------------------------------------

-- NOT NULL
-- Prevents the column from storing NULL values.
------------------------------------------------

-- PRIMARY KEY
-- Makes the column unique and identifies each row.
---------------------------------------------------

-- email does not have NOT NULL,
-- so it can be left empty (NULL).
