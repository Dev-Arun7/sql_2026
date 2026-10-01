-- BETWEEN Operator
-- BETWEEN is used to find values within a range.
-- The starting and ending values are included.

-- General syntax

SELECT *
FROM table_name
WHERE column_name BETWEEN value1 AND value2;

-- Example with dates

SELECT *
FROM person
WHERE date_of_birth
BETWEEN DATE '2000-01-01' AND DATE '2015-01-01';

-- BETWEEN also works with numbers

SELECT *
FROM person
WHERE id BETWEEN 10 AND 20;

-- BETWEEN with ORDER BY
-- We can sort the results after filtering.

SELECT *
FROM person
WHERE date_of_birth
BETWEEN DATE '2000-01-01' AND DATE '2015-01-01'
ORDER BY date_of_birth;

-- BETWEEN with DESC

SELECT *
FROM person
WHERE date_of_birth
BETWEEN DATE '2000-01-01' AND DATE '2015-01-01'
ORDER BY date_of_birth DESC;

-- NOT BETWEEN
-- NOT BETWEEN returns values outside the given range.

SELECT *
FROM person
WHERE id NOT BETWEEN 10 AND 20;

-- Notes
-- BETWEEN includes both the starting and ending values.
-- BETWEEN works with numbers, dates, and other comparable values.
-- Use AND between the two range values.
-- ORDER BY can be used with BETWEEN to sort the results.
