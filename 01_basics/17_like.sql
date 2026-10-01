-- LIKE Operator
-- LIKE is used to search for a pattern in text.
-- It is commonly used with wildcards.

-- General syntax

SELECT *
FROM table_name
WHERE column_name LIKE 'pattern';

-- % wildcard
-- % means zero or more characters.

-- Ends with .com

SELECT *
FROM person
WHERE email LIKE '%.com';

-- Contains "google" anywhere in the email

SELECT *
FROM person
WHERE email LIKE '%google%';

-- Starts with "google"

SELECT *
FROM person
WHERE email LIKE 'google%';

-- Ends with "google.com"

SELECT *
FROM person
WHERE email LIKE '%google.com';

-- _ wildcard
-- _ means exactly one character.

-- Exactly 7 characters before @

SELECT *
FROM person
WHERE email LIKE '_______@%';

-- In the above example:
-- _ = one character
-- _______ = seven characters
-- @ = the @ symbol
-- % = anything after @

-- LIKE is case-sensitive in PostgreSQL.

SELECT *
FROM person
WHERE country_of_birth LIKE 'p%';

-- This will not match "Poland" because
-- LIKE checks uppercase and lowercase differently.

-- ILIKE
-- ILIKE is similar to LIKE but is case-insensitive.

SELECT *
FROM person
WHERE country_of_birth ILIKE 'p%';

-- ILIKE can match "Poland", "poland", "POLAND", etc.

-- More examples

SELECT *
FROM person
WHERE first_name LIKE 'A%';

SELECT *
FROM person
WHERE first_name ILIKE 'a%';

SELECT *
FROM person
WHERE last_name LIKE '%son';

-- LIKE with multiple conditions

SELECT *
FROM person
WHERE email LIKE '%google%'
AND gender = 'Female';

-- NOT LIKE
-- NOT LIKE returns rows that do not match the pattern.

SELECT *
FROM person
WHERE email NOT LIKE '%.com';

-- NOT ILIKE

SELECT *
FROM person
WHERE country_of_birth NOT ILIKE 'p%';


-- DISTINCT ON
-- DISTINCT ON returns only one row for each unique value
-- of the specified column.

-- Example:
-- Get one person for each country that starts with "I".

SELECT DISTINCT ON (country_of_birth) *
FROM person
WHERE country_of_birth ILIKE 'i%';

-- DISTINCT ON works with the selected column.
-- Here, only one row is returned for each
-- unique country_of_birth.


-- Wildcard summary

-- %  = zero or more characters
-- _  = exactly one character

-- Examples

-- 'A%'     -> starts with A
-- '%A'     -> ends with A
-- '%A%'    -> contains A
-- '*A%'     -> second character is A
-- '*______@%' -> exactly 7 characters before @

-- Notes
-- LIKE is case-sensitive.
-- ILIKE is case-insensitive.
-- % can represent any number of characters.
-- _ represents exactly one character.
-- LIKE and ILIKE are very useful for searching text patterns.
