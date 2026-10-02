-- ============================================================
-- EXPORT QUERY RESULT TO CSV
-- ============================================================

-- PostgreSQL psql provides \copy to export query results
-- into a CSV file.

-- Example:

\copy (
SELECT *
FROM person
LEFT JOIN car
ON car.car_uid = person.car_uid
) TO '/home/arun/Documents/sql_2026/02_medium_level/results.csv'
DELIMITER ','
CSV HEADER;

## -- This creates:

## -- results.csv

## -- CSV = Comma-Separated Values

-- HEADER means the column names are included
-- as the first row.

-- ============================================================
-- BASIC SYNTAX
-- ============================================================

\copy (SELECT ...)
TO '/path/file.csv'
DELIMITER ','
CSV HEADER;

-- \copy is a psql command, not normal SQL.
::
