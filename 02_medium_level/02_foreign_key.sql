-- ============================================================
-- FOREIGN KEY
-- ============================================================

## -- A FOREIGN KEY creates a relationship between two tables.

-- It makes sure that a value in one table refers to
-- an existing value in another table.
--------------------------------------

## -- Example:

-- person        car

---

-- id            id
-- car_id   ---> id
-------------------

-- person.car_id refers to car.id.

---

-- 1. WHY DO WE NEED A FOREIGN KEY?

---

## -- Imagine we have these cars:

## -- car

-- id | make       | model
-- ---+------------+--------
--  1 | Land Rover | Sterling
--  2 | GMC        | Acadia
---------------------------

--
-- And we have these people:
----------------------------

## -- person

-- id | first_name | car_id
-- ---+------------+-------
--  1 | Fernanda   | 2
--  2 | Omar       | 1
----------------------

--
-- car_id = 2 means:
--------------------

## -- Fernanda owns the car whose id is 2.

## -- car_id = 1 means:

-- Omar owns the car whose id is 1.

---

-- 2. THE RELATIONSHIP

---

## -- In our person table:

## -- car_id BIGINT REFERENCES car(id)

## -- means:

| -- person.car_id                                |
| ----------------------------------------------- |
| --       v                                      |
| -- car.id                                       |
| --                                              |
| --                                              |
| -- The value stored in person.car_id must exist |
| -- in the car table.                            |

---

-- 3. VALID FOREIGN KEY VALUE

---

## -- Our car table currently contains:

-- id | make       | model
-- ---+------------+--------
--  1 | Land Rover | Sterling
--  2 | GMC        | Acadia
---------------------------

--
-- Therefore this is valid:

UPDATE person
SET car_id = 2
WHERE id = 1;

## -- car_id = 2 exists in car.id.

-- So PostgreSQL allows the update.

---

-- 4. CHECK THE RESULT

---

SELECT *
FROM person;

## -- Example:

-- id | first_name | car_id
-- ---+------------+-------
--  1 | Fernanda   | 2
--  2 | Omar       | NULL
--  3 | John       | NULL

---

-- 5. INVALID FOREIGN KEY VALUE

---

## -- Our car table has only:

-- id = 1
-- id = 2
---------

## -- There is no car with id = 4.

-- Therefore this will fail:

UPDATE person
SET car_id = 4
WHERE id = 2;

## -- PostgreSQL gives an error similar to:

-- ERROR: insert or update on table "person"
-- violates foreign key constraint
----------------------------------

-- DETAIL:
-- Key (car_id)=(4) is not present in table "car".

-- PostgreSQL prevents invalid relationships.

---

-- 6. FOREIGN KEY DOES NOT MEAN UNIQUE

---

-- A foreign key by itself does NOT mean
-- that the value must be unique.
---------------------------------

## -- For example:

-- person 1 -> car 2
-- person 2 -> car 2
--------------------

## -- This is normally allowed with only a FOREIGN KEY.

-- Multiple people can reference the same car.

---

-- 7. OUR TABLE ALSO HAS UNIQUE(car_id)

---

## -- Our person table was created with:

## -- UNIQUE(car_id)

-- Therefore our current design does NOT allow
-- two people to have the same car_id.
--------------------------------------

--
-- Example:
-----------

-- Fernanda -> car 2
-- Omar     -> car 2
--------------------

-- This will fail because car_id = 2 is already used.

UPDATE person
SET car_id = 2
WHERE id = 2;

## -- ERROR:

## -- duplicate key value violates unique constraint

-- This error comes from UNIQUE(car_id),
-- NOT from the FOREIGN KEY.

---

-- 8. DIFFERENCE BETWEEN THE TWO CONSTRAINTS

---

## -- FOREIGN KEY:

## -- Makes sure the referenced car exists.

| -- car_id = 4            |
| ------------------------ |
| --     X                 |
| -- car 4 does not exist. |

## -- UNIQUE:

## -- Makes sure the same car_id is not used twice.

-- person 1 -> car 2
-- person 2 -> car 2
--             X
----------------

-- car_id = 2 is already being used.

---

-- 9. NULL FOREIGN KEY

---

## -- car_id is not defined as NOT NULL.

## -- Therefore NULL is allowed.

-- NULL means the person currently has
-- no car assigned.

UPDATE person
SET car_id = NULL
WHERE id = 2;

-- This is allowed because NULL does not refer
-- to a specific car.

---

-- 10. SEE THE FOREIGN KEY

---

-- In psql:

\d person

## -- You will see:

-- Foreign-key constraints:
--     person_car_id_fkey
--     FOREIGN KEY (car_id) REFERENCES car(id)

## -- You will also see:

## -- "person_car_id_key" UNIQUE CONSTRAINT

## -- because we added:

-- UNIQUE(car_id)

-- ============================================================
-- SIMPLE WAY TO REMEMBER
-- ============================================================

-- PRIMARY KEY
--     Identifies a row.
------------------------

-- UNIQUE
--     Prevents duplicate values.
---------------------------------

-- FOREIGN KEY
--     Makes sure a related value exists
--     in another table.
------------------------

--
-- Example:
-----------

-- car
--     id
---------

-- person
--     car_id
-------------

-- person.car_id ---> car.id

-- ============================================================
-- OUR RELATIONSHIP
-- ============================================================

## -- car table:

-- id | make       | model
-- ---+------------+--------
--  1 | Land Rover | Sterling
--  2 | GMC        | Acadia
---------------------------

--
-- person table:
----------------

-- id | first_name | car_id
-- ---+------------+-------
--  1 | Fernanda   | 2
--  2 | Omar       | 1
--  3 | John       | NULL
-------------------------

--
-- Fernanda -> GMC Acadia
-- Omar     -> Land Rover Sterling
-- John     -> no car assigned

-- ============================================================
-- IMPORTANT
-- ============================================================

-- A FOREIGN KEY does NOT copy the car data
-- into the person table.
-------------------------

## -- It only stores the car's id.

## -- person.car_id = 2

## -- tells us to look at:

## -- car.id = 2

-- Later, we can use JOIN to retrieve the
-- complete car information.

-- ============================================================
-- SUMMARY
-- ============================================================

## -- FOREIGN KEY creates a relationship between tables.

## -- Example:

## -- car_id BIGINT REFERENCES car(id)

## -- This means:

## -- person.car_id must refer to an existing car.id.

## -- Invalid:

-- car_id = 4
-- when car.id = 4 does not exist.
----------------------------------

## -- Valid:

-- car_id = 1
-- when car.id = 1 exists.
--------------------------

-- UNIQUE(car_id) is separate.
-- It prevents two people from using the same car_id.
-----------------------------------------------------

-- JOIN will be used later to retrieve data
-- from both related tables.
-- ============================================================
