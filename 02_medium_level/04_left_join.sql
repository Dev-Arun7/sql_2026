-- LEFT JOIN

---

-- LEFT JOIN returns ALL rows from the left table.
-- If there is no matching row in the right table,
-- the right table columns will contain NULL.

-- Current relationship:
-- person.car_id -> car.id

-- 1. INNER JOIN
-- Only people who have a matching car are returned.

SELECT *
FROM person
JOIN car ON person.car_id = car.id;

-- 2. LEFT JOIN
-- ALL people are returned.
-- John is included even though car_id is NULL.

SELECT *
FROM person
LEFT JOIN car ON person.car_id = car.id;

-- 3. Select only useful columns

SELECT
person.first_name,
person.last_name,
car.make,
car.model,
car.price
FROM person
LEFT JOIN car ON person.car_id = car.id;

## -- Result:

-- first_name | last_name | make       | model    | price
-- ------------+-----------+------------+----------+----------
-- Omar        | Colmore   | Land Rover | Sterling | 87665.38
-- Fernanda    | Beardon   | GMC        | Acadia   | 17662.69
-- John        | Matuschek | NULL       | NULL     | NULL

-- 4. Find people who don't have a car

SELECT *
FROM person
LEFT JOIN car ON person.car_id = car.id
WHERE car.id IS NULL;

## -- Result:

-- John | Matuschek | ... | NULL | NULL | NULL

-- 5. LEFT JOIN with aliases

SELECT
p.first_name,
p.last_name,
c.make,
c.model
FROM person p
LEFT JOIN car c ON p.car_id = c.id;

-- IMPORTANT
-- LEFT JOIN:
--   Keep ALL rows from the left table.
---------------------------------------

-- INNER JOIN:
--   Keep only matching rows.
-----------------------------

## -- The table before LEFT JOIN is the left table.

-- FROM person
-- LEFT JOIN car
----------------

-- means:
-- Keep all people, even if they don't have a car.
