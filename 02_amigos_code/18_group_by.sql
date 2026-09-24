-- GROUP BY
-- GROUP BY is used to group rows that have the same value.
-- It is commonly used with aggregate functions like COUNT(), SUM(), AVG(), MIN(), and MAX().

-- COUNT()
-- COUNT(*) counts the number of rows.

-- Count people from each country

SELECT country_of_birth, COUNT(*)
FROM person
GROUP BY country_of_birth;

-- Give the count column a name using AS

SELECT country_of_birth, COUNT(*) AS total_people
FROM person
GROUP BY country_of_birth;

-- Sort the result by country

SELECT country_of_birth, COUNT(*) AS total_people
FROM person
GROUP BY country_of_birth
ORDER BY country_of_birth;

-- Sort by number of people

SELECT country_of_birth, COUNT(*) AS total_people
FROM person
GROUP BY country_of_birth
ORDER BY total_people;

-- Sort by number of people from highest to lowest

SELECT country_of_birth, COUNT(*) AS total_people
FROM person
GROUP BY country_of_birth
ORDER BY total_people DESC;

-- GROUP BY another column

SELECT gender, COUNT(*) AS total_people
FROM person
GROUP BY gender;

-- GROUP BY multiple columns

SELECT country_of_birth, gender, COUNT(*) AS total_people
FROM person
GROUP BY country_of_birth, gender;

-- Notes
-- GROUP BY combines rows with the same value.
-- COUNT(*) counts rows in each group.
-- AS gives a temporary name to a result column.
-- ORDER BY can be used after GROUP BY to sort the result.
-- HAVING is not covered here.
-- HAVING will be covered in the next file.
