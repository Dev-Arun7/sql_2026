-- IN Operator
-- IN is used to check if a value matches any value in a list.
-- It is a shorter and cleaner way to write multiple OR conditions.

-- General syntax

SELECT *
FROM table_name
WHERE column_name IN (value1, value2, value3);

-- Example

SELECT *
FROM person
WHERE country_of_birth IN ('China', 'France', 'India');

-- The above query is the same as:

SELECT *
FROM person
WHERE country_of_birth = 'China'
OR country_of_birth = 'France'
OR country_of_birth = 'India';

-- Another example

SELECT *
FROM person
WHERE gender IN ('Male', 'Female');

-- IN can also be used with numbers

SELECT *
FROM person
WHERE id IN (1, 5, 10);

-- NOT IN
-- NOT IN returns rows that do NOT match any value in the list.

SELECT *
FROM person
WHERE country_of_birth NOT IN ('China', 'France', 'India');

-- Notes
-- IN is useful when checking multiple possible values.
-- Use quotes for text values.
-- Do not use quotes for numbers.
-- IN is cleaner than writing many OR conditions.
-- Be careful with spelling. For example, 'India' and 'Inida' are different values.
