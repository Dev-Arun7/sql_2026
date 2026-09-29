-- AGE()
-- AGE() calculates the difference between two dates.
-- It is commonly used to calculate a person's age.

-- General syntax

SELECT AGE(date1, date2);

-- Calculate age using the current date

SELECT AGE(NOW(), DATE '2000-01-01');

-- Calculate the age of people in the person table

SELECT
first_name,
gender,
country_of_birth,
date_of_birth,
AGE(NOW(), date_of_birth) AS age
FROM person;

-- AGE() can also be used with a specific date

SELECT AGE(DATE '2026-09-25', DATE '2000-01-01');

-- Notes
-- AGE() returns the difference between two dates.
-- NOW() gives the current date and time.
-- AGE(NOW(), date_of_birth) can be used to calculate age.
-- AS can be used to give the result a readable name.
