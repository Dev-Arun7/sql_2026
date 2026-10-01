-- =====================================================
-- COMPARISON OPERATORS
-- =====================================================

-- Comparison operators are used to compare values.
-- They return either TRUE (t) or FALSE (f).

-- =====================================================
-- COMMON OPERATORS
-- =====================================================

-- =   Equal to
-- <>  Not equal to
-- <   Less than
-- >   Greater than
-- <=  Less than or equal to
-- >=  Greater than or equal to

-- =====================================================
-- EXAMPLES
-- =====================================================

SELECT 1 = 1;

SELECT 1 = 2;

SELECT 1 < 2;

SELECT 1 <= 1;

SELECT 1 <> 2;

SELECT 1 <> 1;

-- Text values can also be compared.

SELECT 'arun' <> 'ARUN';

SELECT 'arun' <> 'arun';

-- =====================================================
-- USING COMPARISON OPERATORS WITH WHERE
-- =====================================================

SELECT *
FROM person
WHERE id > 100;

SELECT *
FROM person
WHERE id <= 100;

SELECT *
FROM person
WHERE gender = 'Male';

SELECT *
FROM person
WHERE gender <> 'Male';

-- =====================================================
-- NOTES
-- =====================================================

-- TRUE is displayed as: t
-- FALSE is displayed as: f
---------------------------

## -- Text comparisons are case-sensitive.

-- 'arun' and 'ARUN' are treated as different values.
