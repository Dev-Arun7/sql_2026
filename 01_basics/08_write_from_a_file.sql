-- =====================================================
-- RUN A SQL FILE
-- =====================================================

## -- \i is used to execute a SQL file from inside psql.

-- PostgreSQL will read the SQL file and execute
-- the commands written inside it.

## -- General syntax:

-- \i /path/to/file.sql

-- Example:
\i /home/arun/Documents/sql_2026/02_amigos_code/07_person.sql

-- =====================================================
-- BEFORE RUNNING THE FILE
-- =====================================================

-- 1. Make sure the SQL file actually exists
--    at the given path.
------------------------

## -- 2. Change the path according to your computer.

-- 3. If the SQL file creates a table that already exists,
--    you may need to drop the table first.
-------------------------------------------

-- Example:
DROP TABLE IF EXISTS person;

-- Then run the SQL file again:
\i /home/arun/Documents/sql_2026/02_amigos_code/07_person.sql

-- =====================================================
-- WHAT ARE WE DOING?
-- =====================================================

-- Instead of typing all the SQL commands manually,
-- \i allows us to execute all commands from a
-- saved .sql file.
-------------------

-- This is useful when a file contains commands such as:
-- CREATE TABLE
-- INSERT INTO
-- SELECT
-- and other SQL statements.
