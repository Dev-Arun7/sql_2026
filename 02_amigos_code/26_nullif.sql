-- NULLIF
-- NULLIF compares two values.
-- If both values are equal, it returns NULL.
-- If they are different, it returns the first value.

-- Equal values

SELECT NULLIF(10, 10);

-- Different values

SELECT NULLIF(10, 1);

SELECT NULLIF(10, 19);

SELECT NULLIF(100, 19);

-- Same values return NULL

SELECT NULLIF(100, 100);

-- NULLIF can be useful for avoiding division by zero.

-- This causes an error:

SELECT 100 / 0;

-- NULLIF(0, 0) returns NULL.

SELECT NULLIF(0, 0);

-- Dividing by NULL returns NULL instead of an error.

SELECT 20 / NULLIF(0, 0);

-- Another example

SELECT 10 / NULLIF(2, 9);

-- NULLIF(2, 9) returns 2 because 2 and 9 are different.
-- So the calculation becomes:
-- 10 / 2 = 5

-- COALESCE + NULLIF
-- COALESCE can replace the NULL result with a default value.

SELECT COALESCE(20 / NULLIF(0, 0), 0);

-- The calculation works like this:
-- NULLIF(0, 0) -> NULL
-- 20 / NULL -> NULL
-- COALESCE(NULL, 0) -> 0

-- Notes
-- NULLIF(value1, value2)
-- If value1 = value2 -> NULL
-- If value1 != value2 -> value1
--------------------------------

-- NULLIF is useful when you need to turn a specific value
-- into NULL.
-- A common use is preventing division-by-zero errors.
-- COALESCE can then be used to replace the NULL result.
