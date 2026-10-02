-- ============================================================
-- UUID BASICS
-- ============================================================

## -- UUID = Universally Unique Identifier

## -- UUID is another way to create unique identifiers.

## -- Unlike BIGSERIAL, UUIDs are not simple numbers like:

-- 1
-- 2
-- 3
-- 4

-- ============================================================
-- 1. WHY DO WE NEED UUID?
-- ============================================================

## -- BIGSERIAL generates IDs in sequence:

## -- 1, 2, 3, 4, 5...

-- UUID can generate an ID without depending on
-- a simple increasing number.

## -- UUIDs are useful when:

-- - We want identifiers that are very unlikely to collide.
-- - IDs may be generated in different systems.
-- - We don't want simple sequential IDs.

-- ============================================================
-- 2. ENABLE UUID SUPPORT
-- ============================================================

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================================
-- 3. GENERATE A UUID
-- ============================================================

SELECT uuid_generate_v4();

## -- Example:

-- ba6c9fb4-86bc-4a8d-8024-d220aca94b8d

-- Run it again:

SELECT uuid_generate_v4();

## -- Example:

-- 22ee7743-5015-4e67-82c9-7aed575be141

-- ============================================================
-- 4. EACH CALL GENERATES A NEW RANDOM UUID
-- ============================================================

SELECT uuid_generate_v4();

SELECT uuid_generate_v4();

SELECT uuid_generate_v4();

-- Every call generates a different,
-- very random-looking UUID.
----------------------------

## -- Example:

-- 7f4a7c2e-...
-- 1b8d9f31-...
-- c92e45a7-...

## -- UUIDs generated with v4 are random-based.

-- The chance of generating the same UUID is
-- extremely small.

-- ============================================================
-- SUMMARY
-- ============================================================

## -- UUID is an alternative way to create unique IDs.

-- BIGSERIAL:
--   1, 2, 3, 4, 5...
---------------------

-- UUID:
--   ba6c9fb4-86bc-4a8d-8024-d220aca94b8d
-----------------------------------------

## -- uuid_generate_v4() generates a random UUID.

-- Every time we run uuid_generate_v4(),
-- we get a new random-looking value.
-------------------------------------

-- We will learn how to use UUID in a table
-- in the next file.
::
