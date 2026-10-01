-- ============================================================
-- BIGSERIAL
-- ============================================================

-- BIGSERIAL is commonly used for automatically
-- generating increasing ID numbers.

-- ============================================================
-- 1. BIGSERIAL PRIMARY KEY
-- ============================================================

CREATE TABLE person (
id BIGSERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL
);

-- BIGSERIAL automatically creates a sequence
-- and uses it to generate the id.

-- ============================================================
-- 2. INSERT WITHOUT ID
-- ============================================================

INSERT INTO person (first_name, last_name)
VALUES ('John', 'Smith');

## -- PostgreSQL automatically generates the ID.

-- id | first_name | last_name
-- ---+------------+----------
--  1 | John       | Smith

INSERT INTO person (first_name, last_name)
VALUES ('David', 'Brown');

## -- Result:

-- id | first_name | last_name
-- ---+------------+----------
--  1 | John       | Smith
--  2 | David      | Brown

-- We don't need to provide the id.

-- ============================================================
-- 3. THE SEQUENCE
-- ============================================================

## -- BIGSERIAL uses a sequence behind the scenes.

## -- For example:

-- person_id_seq

-- Check the table:

\d person

## -- You may see:

-- id | bigint | ... | nextval('person_id_seq'::regclass)

-- This means the id gets its value from the sequence.

-- ============================================================
-- 4. CHECK THE SEQUENCE
-- ============================================================

SELECT *
FROM person_id_seq;

-- You can also get the next value:

SELECT nextval('person_id_seq'::regclass);

## -- IMPORTANT:

## -- nextval() actually moves the sequence forward.

## -- If the sequence was 4:

-- nextval() → 5
-- nextval() → 6
-- nextval() → 7
----------------

-- So don't call nextval() just to check the value.

-- ============================================================
-- 5. INSERT AFTER USING nextval()
-- ============================================================

## -- If the sequence is currently 8:

## -- nextval() → 9

## -- The next INSERT will use:

-- 10

-- Example:

INSERT INTO person (first_name, last_name)
VALUES ('Hayes', 'Yewdale');

-- The generated ID will use the next sequence value.

-- ============================================================
-- 6. IMPORTANT: SEQUENCE IS NOT THE TABLE
-- ============================================================

## -- The sequence keeps track of numbers.

-- It does NOT check which IDs currently exist in the table.

## -- For example:

-- 1
-- 2
-- 3
-- 4
----

-- If row 4 is deleted, the sequence does not
-- automatically go back to 4.
------------------------------

-- The next generated ID can be 5.

-- ============================================================
-- 7. BIGSERIAL DOES NOT MEAN BIG DATA
-- ============================================================

## -- BIGSERIAL is about the ID number type.

## -- BIGSERIAL uses BIGINT.

## -- It allows a very large range of ID values.

-- It does NOT mean that PostgreSQL stores
-- every possible number.

-- ============================================================
-- SUMMARY
-- ============================================================

-- BIGSERIAL:
--   Automatically generates ID values.
---------------------------------------

-- BIGSERIAL uses:
--   BIGINT + a sequence
------------------------

## -- Example:

## -- id BIGSERIAL PRIMARY KEY

## -- When inserting:

-- INSERT INTO person (first_name, last_name)
-- VALUES ('John', 'Smith');
----------------------------

## -- PostgreSQL automatically generates the ID.

## -- IMPORTANT:

## -- nextval() moves the sequence forward.

-- Deleting a row does not reset the sequence.
