
-- =====================================================
-- SQL COMMENTS
-- =====================================================


-- 1. Single-line comment
-- Anything after -- on this line is ignored by SQL.

SELECT 10;


-- 2. Comment after SQL code
SELECT 20; -- This comment explains the query.


-- 3. Multi-line comment
/*
This is a multi-line comment.

You can write many lines
inside these symbols.

SQL will ignore everything
between /* and */.
*/

SELECT 30;


/*
Comments are useful for:
- Explaining code
- Adding notes
- Making code easier to understand
- Temporarily disabling SQL code
*/


-- This query will run
SELECT 40;


-- This query will NOT run because it is commented out
-- SELECT 50;
