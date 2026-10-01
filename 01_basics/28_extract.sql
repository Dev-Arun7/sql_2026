-- EXTRACT()
-- EXTRACT() is used to get a specific part
-- of a date or time value.

-- General syntax

SELECT EXTRACT(part FROM date_or_time);

-- Get the year

SELECT EXTRACT(YEAR FROM NOW());

-- Get the month

SELECT EXTRACT(MONTH FROM NOW());

-- Get the day

SELECT EXTRACT(DAY FROM NOW());

-- Get the day of the week

SELECT EXTRACT(DOW FROM NOW());

-- DOW means Day Of Week.
-- 0 = Sunday
-- 1 = Monday
-- 2 = Tuesday
-- 3 = Wednesday
-- 4 = Thursday
-- 5 = Friday
-- 6 = Saturday

-- Get the century

SELECT EXTRACT(CENTURY FROM NOW());

-- More useful examples

SELECT EXTRACT(HOUR FROM NOW());

SELECT EXTRACT(MINUTE FROM NOW());

SELECT EXTRACT(SECOND FROM NOW());

-- EXTRACT() can also be used with a table column.

SELECT
first_name,
date_of_birth,
EXTRACT(YEAR FROM date_of_birth) AS birth_year
FROM person;

-- Get people born in a particular year

SELECT *
FROM person
WHERE EXTRACT(YEAR FROM date_of_birth) = 2000;

-- Notes
-- EXTRACT() gets a specific part of a date or time.
-- YEAR, MONTH, DAY, HOUR, MINUTE and SECOND can be extracted.
-- DOW means Day Of Week.
-- DOW starts with Sunday = 0.
-- The result of EXTRACT() is a number.
