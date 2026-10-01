-- HAVING
-- HAVING is used to filter groups created by GROUP BY.
-- HAVING is commonly used with aggregate functions like COUNT(), SUM(), AVG(), MIN(), and MAX().

-- General syntax

SELECT column_name, COUNT(*)
FROM table_name
GROUP BY column_name
HAVING COUNT(*) > number;

-- Example
-- Show countries that have more than 10 people.

SELECT country_of_birth, COUNT(*)
FROM person
GROUP BY country_of_birth
HAVING COUNT(*) > 10;

-- HAVING with ORDER BY

SELECT country_of_birth, COUNT(*)
FROM person
GROUP BY country_of_birth
HAVING COUNT(*) > 10
ORDER BY country_of_birth;

-- Using an alias

SELECT country_of_birth, COUNT(*) AS total_people
FROM person
GROUP BY country_of_birth
HAVING COUNT(*) > 10
ORDER BY total_people DESC;

-- WHERE vs HAVING

-- WHERE filters individual rows before GROUP BY.

SELECT country_of_birth, COUNT(*)
FROM person
WHERE gender = 'Male'
GROUP BY country_of_birth;

-- HAVING filters groups after GROUP BY.

SELECT country_of_birth, COUNT(*)
FROM person
GROUP BY country_of_birth
HAVING COUNT(*) > 10;

-- WHERE + GROUP BY + HAVING

SELECT country_of_birth, COUNT(*) AS total_people
FROM person
WHERE gender = 'Male'
GROUP BY country_of_birth
HAVING COUNT(*) > 10
ORDER BY total_people DESC;

-- Notes
-- WHERE filters rows.
-- GROUP BY creates groups.
-- HAVING filters groups.
-- HAVING is commonly used with aggregate functions.
-- ORDER BY sorts the final result.
