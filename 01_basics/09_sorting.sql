-- =====================================================
-- ORDER BY
-- =====================================================

-- ORDER BY is used to sort the result of a query.

## -- General syntax:

-- SELECT *
-- FROM table_name
-- ORDER BY column_name;

-- =====================================================
-- ASCENDING ORDER
-- =====================================================

-- ASC means ascending order.
-- ASC is the default, so we can also leave it out.

SELECT *
FROM person
ORDER BY country_of_birth;

-- Same as:

SELECT *
FROM person
ORDER BY country_of_birth ASC;

-- =====================================================
-- DESCENDING ORDER
-- =====================================================

-- DESC means descending order.

SELECT *
FROM person
ORDER BY country_of_birth DESC;

-- =====================================================
-- SORT USING DIFFERENT COLUMNS
-- =====================================================

SELECT *
FROM person
ORDER BY id DESC;

SELECT *
FROM person
ORDER BY first_name;

SELECT *
FROM person
ORDER BY date_of_birth;

-- =====================================================
-- SORT USING MULTIPLE COLUMNS
-- =====================================================

-- PostgreSQL first sorts by first_name.
-- If two people have the same first_name,
-- it then sorts those rows by date_of_birth.

SELECT *
FROM person
ORDER BY first_name, date_of_birth;

-- We can also specify ASC or DESC for each column.

SELECT *
FROM person
ORDER BY first_name ASC, date_of_birth DESC;

-- =====================================================
-- SELECTED COLUMN WITH SORTING
-- =====================================================

SELECT country_of_birth
FROM person
ORDER BY country_of_birth;

-- =====================================================
-- NOTES
-- =====================================================

-- ASC  -> Ascending order
-- DESC -> Descending order
---------------------------

## -- ASC is the default.

## -- Column names must be spelled correctly.

-- Example:
-- date_of_birth   ✅
-- date_0f_birth   ❌ ('O' capital letter is wrong)
--------------------

-- DESC is correct.
-- DSC is incorrect.
