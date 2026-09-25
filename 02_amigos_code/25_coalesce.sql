-- COALESCE
-- COALESCE returns the first value that is NOT NULL.

-- Basic example

SELECT COALESCE(1);

-- Give the result a name

SELECT COALESCE(1) AS number;

-- If the first value is NULL,
-- COALESCE returns the next available value.

SELECT COALESCE(NULL, 1) AS number;

-- COALESCE can have multiple values.

SELECT COALESCE(NULL, NULL, 1) AS number;

-- It stops at the first non-NULL value.

SELECT COALESCE(NULL, NULL, 1, 10) AS number;

-- Example with the person table

SELECT email
FROM person;

-- Replace NULL email values with a message.

SELECT COALESCE(email, 'Email not provided')
FROM person;

-- Give the result a readable name.

SELECT COALESCE(email, 'Email not provided') AS email
FROM person;

-- Another example

SELECT
first_name,
last_name,
COALESCE(email, 'Email not provided') AS email
FROM person;

-- Notes
-- COALESCE returns the first non-NULL value.
-- NULL is different from an empty string ('').
-- COALESCE is useful for replacing NULL values with a default value.
-- You can provide multiple values to COALESCE().
-- COALESCE checks values from left to right.


