-- =====================================================
-- DISTINCT
-- =====================================================

## -- DISTINCT removes duplicate values from the result.

-- It is useful when we want to see only the
-- unique values in a column.

## -- General syntax:

-- SELECT DISTINCT column_name
-- FROM table_name;

-- =====================================================
-- EXAMPLE
-- =====================================================

-- Show unique countries of birth

SELECT DISTINCT country_of_birth
FROM person;

-- =====================================================
-- DISTINCT WITH ORDER BY
-- =====================================================

-- Unique countries in ascending order

SELECT DISTINCT country_of_birth
FROM person
ORDER BY country_of_birth;

-- Unique countries in descending order

SELECT DISTINCT country_of_birth
FROM person
ORDER BY country_of_birth DESC;

-- =====================================================
-- NOTES
-- =====================================================

## -- DISTINCT removes duplicate values.

## -- Example:

-- India
-- India
-- USA
-- UK
-- UK
-- UK
-- USA
------

## -- With DISTINCT:

-- India
-- USA
-- UK
-----

-- DISTINCT works on the selected column(s).
