-- =====================================================
-- WHERE, AND, OR
-- =====================================================

-- WHERE is used to filter rows based on a condition.

## -- General syntax:

-- SELECT *
-- FROM table_name
-- WHERE condition;

-- =====================================================
-- WHERE
-- =====================================================

-- Get people whose gender is Male

SELECT *
FROM person
WHERE gender = 'Male';

-- =====================================================
-- AND
-- =====================================================

## -- AND means ALL conditions must be true.

-- Get people who are Male AND were born in Poland.

SELECT *
FROM person
WHERE gender = 'Male'
AND country_of_birth = 'Poland';

-- =====================================================
-- OR
-- =====================================================

## -- OR means at least ONE condition must be true.

-- Get people who were born in Poland OR India.

SELECT *
FROM person
WHERE country_of_birth = 'Poland'
OR country_of_birth = 'India';

-- =====================================================
-- AND + OR
-- =====================================================

-- Get Male people from Poland,
-- OR anyone from India.

SELECT *
FROM person
WHERE gender = 'Male'
AND country_of_birth = 'Poland'
OR country_of_birth = 'India';

-- =====================================================
-- USING PARENTHESES
-- =====================================================

## -- Parentheses make the condition clear.

-- Get Male people who are from Poland OR India.

SELECT *
FROM person
WHERE gender = 'Male'
AND (
country_of_birth = 'Poland'
OR country_of_birth = 'India'
);

-- =====================================================
-- NOTES
-- =====================================================

## -- WHERE -> Filters rows.

## -- AND -> All conditions must be true.

## -- OR -> At least one condition must be true.

## -- Parentheses () can be used to group conditions.

-- When using AND and OR together, parentheses
-- help make the intended logic clear.
