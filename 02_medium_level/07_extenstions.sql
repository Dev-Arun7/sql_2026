-- ============================================================
-- POSTGRESQL EXTENSIONS
-- ============================================================

-- PostgreSQL has extensions.
-- Extensions add extra features to PostgreSQL.
-----------------------------------------------

-- We do NOT need to learn all extensions now.
-- We can install an extension when a project needs it.
-------------------------------------------------------

-- 1. SEE AVAILABLE EXTENSIONS

-- Shows extensions that PostgreSQL can install.

SELECT *
FROM pg_available_extensions;

-- 2. SEE INSTALLED EXTENSIONS

-- Shows extensions currently installed
-- in the current database.

SELECT *
FROM pg_extension;

-- Another simple way:

\dx

## -- 3. EXAMPLE EXTENSIONS

-- uuid-ossp
-- Used to generate UUID values.

-- pgcrypto
-- Provides cryptographic functions.

-- pg_trgm
-- Useful for text similarity and searching.

-- PostGIS
-- Used for geographical/location data.
-- (Usually installed separately depending on the setup.)

## -- IMPORTANT

## -- An extension can be:

-- Available
--     ↓
-- PostgreSQL knows about it and it can be installed.
-----------------------------------------------------

-- Installed
--     ↓
-- The extension is actually enabled in the current database.
-------------------------------------------------------------

-- We only install an extension when we need its features.

## -- Example:

## -- CREATE EXTENSION extension_name;

## -- Example:

-- CREATE EXTENSION "uuid-ossp";

-- For now:
-- Just remember what extensions are.
-- Learn individual extensions only when a project needs them.
