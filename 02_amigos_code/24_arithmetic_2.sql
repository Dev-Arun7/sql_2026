-- Arithmetic Operators with Table Data
-- Arithmetic operators can be used with table columns.

-- Show the car price and calculate 10% of the price.

SELECT id, make, model, price, price * 0.10
FROM car;

-- ROUND()
-- Round the calculated value to 2 decimal places.

SELECT id, make, model, price,
ROUND(price * 0.10, 2)
FROM car;

-- Calculate the price after a 10% discount.

SELECT id, make, model, price,
ROUND(price * 0.10, 2),
ROUND(price - (price * 0.10))
FROM car;

-- Aliases
-- An alias gives a temporary name to a column in the result.

SELECT
id,
make,
model,
price AS original_price,
ROUND(price * 0.10, 2) AS ten_percent,
ROUND(price - (price * 0.10)) AS discount_after_10_percent
FROM car;

-- Another example
-- Calculate a 20% increase in price.

SELECT
id,
make,
model,
price AS original_price,
ROUND(price * 1.20, 2) AS price_after_20_percent_increase
FROM car;

-- Notes
-- Arithmetic operators can be used with table columns.
-- Calculated columns do not change the original data.
-- AS is used to give a calculated column a readable name.
-- ROUND() can be used to control decimal places.
-- Alias is a temporary name used only in the query result.
