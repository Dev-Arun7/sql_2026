-- First load the car.sql data

-- Change location path if you need

\i /home/arun/Documents/sql_2026/02_amigos_code/20_car.sql

-- Aggregate Functions
-- Aggregate functions calculate a single result from multiple rows.

-- MAX()
-- Returns the highest value.

SELECT MAX(price)
FROM car;

-- MIN()
-- Returns the lowest value.

SELECT MIN(price)
FROM car;

-- AS can be used to give the result a name.

SELECT MAX(price) AS expensive
FROM car;

SELECT MIN(price) AS cheapest
FROM car;

-- AVG()
-- Returns the average value.

SELECT AVG(price)
FROM car;

-- ROUND()
-- ROUND() can be used to round a number.

SELECT ROUND(AVG(price))
FROM car;

-- ROUND() can also specify decimal places.

SELECT ROUND(AVG(price), 2)
FROM car;

-- GROUP BY with MIN()
-- Find the cheapest car for each make and model.

SELECT make, model, MIN(price)
FROM car
GROUP BY make, model;

-- GROUP BY with MAX()
-- Find the most expensive car for each make.

SELECT make, MAX(price)
FROM car
GROUP BY make;

-- GROUP BY with AVG()
-- Find the average price for each make.

SELECT make, AVG(price)
FROM car
GROUP BY make;

-- GROUP BY with AVG() and ORDER BY

SELECT make, AVG(price) AS average_price
FROM car
GROUP BY make
ORDER BY average_price DESC;

-- Multiple aggregate functions

SELECT
make,
MIN(price) AS cheapest,
MAX(price) AS expensive,
AVG(price) AS average_price
FROM car
GROUP BY make;

-- Common mistake

-- This is incorrect:

-- SELECT make MAX(price)
-- FROM car
-- GROUP BY make;

-- A comma is needed between columns and functions.

SELECT make, MAX(price)
FROM car
GROUP BY make;

-- Notes
-- MAX() returns the highest value.
-- MIN() returns the lowest value.
-- AVG() returns the average value.
-- COUNT() counts rows.
-- ROUND() rounds a number.
-- GROUP BY can be used with aggregate functions.
-- Use a comma when selecting multiple columns or expressions.
