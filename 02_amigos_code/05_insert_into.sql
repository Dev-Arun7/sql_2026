-- =====================================================
-- INSERT DATA
-- =====================================================

-- INSERT is used to add data into a table.

## -- General syntax:

-- INSERT INTO table_name (column1, column2, column3)
-- VALUES (value1, value2, value3);

-- =====================================================
-- INSERT DATA
-- =====================================================

INSERT INTO person (first_name, last_name, gender, date_of_birth, email)
VALUES ('Jake', 'Jones', 'MALE', DATE '1990-12-31', 'john@gmail.com');

-- Email is optional because the email column
-- does not have a NOT NULL constraint.

INSERT INTO person (first_name, last_name, gender, date_of_birth)
VALUES ('Anne', 'Smith', 'FEMALE', DATE '1988-01-09');

-- =====================================================
-- CHECK THE DATA
-- =====================================================

SELECT * FROM person;

-- =====================================================
-- INSERT WITHOUT COLUMN NAMES
-- =====================================================

-- We can insert data without specifying column names.
-- But values must follow the exact order of the columns.
---------------------------------------------------------

-- Since id is BIGSERIAL, use DEFAULT for id.

INSERT INTO person
VALUES (DEFAULT, 'John', 'Doe', 'MALE', DATE '1992-05-20', 'john@gmail.com');

-- Check the data again
SELECT * FROM person;

-- =====================================================
-- NOTES
-- =====================================================

-- Always make sure the number of values matches
-- the number of columns you specify.
-------------------------------------

-- Column names make INSERT statements easier to
-- understand and are recommended for beginners.
