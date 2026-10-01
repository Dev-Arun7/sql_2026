-- SUM()
-- SUM() adds together all values in a column.

SELECT SUM(price)
FROM car;

-- SUM() with GROUP BY
-- Calculate the total price for each make.

SELECT make, SUM(price)
FROM car
GROUP BY make;

-- Give the result a name using AS

SELECT make, SUM(price) AS total_price
FROM car
GROUP BY make;

-- Sort by total price

SELECT make, SUM(price) AS total_price
FROM car
GROUP BY make
ORDER BY total_price DESC;

-- Aggregate Functions
-- COUNT() -> counts rows
-- SUM()   -> adds values
-- AVG()   -> calculates the average
-- MIN()   -> finds the lowest value
-- MAX()   -> finds the highest value

-- Multiple aggregate functions

SELECT
make,
COUNT(*) AS total_cars,
SUM(price) AS total_price,
AVG(price) AS average_price,
MIN(price) AS cheapest,
MAX(price) AS expensive
FROM car
GROUP BY make;

-- Notes
-- Aggregate functions calculate a result from multiple rows.
-- GROUP BY can be used to calculate results separately for each group.
-- SUM() is useful for calculating totals.
