-- =====================================================
-- CONCATENATE COLUMNS
-- =====================================================

-- Concatenation means joining two or more values together.
-- PostgreSQL uses || to concatenate values.

-- =====================================================
-- CONCATENATE TWO COLUMNS
-- =====================================================

-- Join first_name and last_name together.

SELECT first_name || last_name
FROM person;

-- Example result:
-- BritneyBagguley
-- PhilomenaBernardet
-- GerekCopeman

-- =====================================================
-- ADD A SPACE BETWEEN VALUES
-- =====================================================

-- ' ' represents a space.
-- We can use || to join the space as well.

SELECT first_name || ' ' || last_name
FROM person;

-- Example result:
-- Britney Bagguley
-- Philomena Bernardet
-- Gerek Copeman

-- =====================================================
-- GIVE THE RESULT A NAME
-- =====================================================

-- AS is used to give a temporary name to the result.

SELECT first_name || ' ' || last_name AS full_name
FROM person;

-- Example result:
-- full_name

---

-- Britney Bagguley
-- Philomena Bernardet
-- Gerek Copeman

-- =====================================================
-- CONCATENATE MORE THAN TWO VALUES
-- =====================================================

-- We can concatenate multiple columns and values.

SELECT first_name || ' ' || last_name || ' - ' || gender AS person_info
FROM person;

-- Example result:
-- Britney Bagguley - Female
-- Gerek Copeman - Male
-- Hayes Yewdale - Male

-- =====================================================
-- CONCATENATE COLUMNS WITH TEXT
-- =====================================================

-- We can add our own text while concatenating.

SELECT 'Name: ' || first_name || ' ' || last_name AS person_name
FROM person;

-- Example result:
-- Name: Britney Bagguley
-- Name: Philomena Bernardet
-- Name: Gerek Copeman

-- =====================================================
-- NOTES
-- =====================================================

-- || -> Concatenates (joins) values

-- ' ' -> A space

-- 'text' -> Text must be written inside single quotes

-- AS -> Gives a name to the result column

-- Examples:

-- first_name || last_name
-- -> BritneyBagguley

-- first_name || ' ' || last_name
-- -> Britney Bagguley

-- first_name || ' ' || last_name AS full_name
-- -> Creates a result column named full_name

-- =====================================================
-- IMPORTANT
-- =====================================================

-- PostgreSQL uses || for concatenation.

-- Do NOT use + to concatenate strings.

-- Example:

-- Correct:
-- SELECT first_name || ' ' || last_name
-- FROM person;

-- Not for PostgreSQL string concatenation:
-- SELECT first_name + ' ' + last_name
-- FROM person;
