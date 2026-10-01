-- ============================================================
-- DELETE WITH FOREIGN KEY
-- ============================================================

-- A FOREIGN KEY creates a relationship between tables.

-- Our relationship:

-- person.car_id
--      ↓
-- car.id

-- ============================================================
-- 1. OUR DATA
-- ============================================================

## -- person:

-- id | first_name | car_id
-- ---+------------+-------
--  3 | John       | NULL
--  1 | Fernanda   | 2
--  2 | Omar       | 1

## -- car:

-- id | make       | model
-- ---+------------+--------
--  1 | Land Rover | Sterling
--  2 | GMC        | Acadia

-- ============================================================
-- 2. TRY TO DELETE A REFERENCED CAR
-- ============================================================

## -- Car 1 is being used by Omar.

-- So PostgreSQL will NOT allow this:

DELETE FROM car
WHERE id = 1;

## -- ERROR:

-- update or delete on table "car" violates
-- foreign key constraint
-------------------------

## -- Why?

-- person.car_id = 1
-- is still referencing
-- car.id = 1

-- ============================================================
-- 3. REMOVE THE FOREIGN KEY VALUE FIRST
-- ============================================================

-- We can remove the relationship:

UPDATE person
SET car_id = NULL
WHERE car_id = 1;

## -- Now no person is using car 1.

-- We can delete the car:

DELETE FROM car
WHERE id = 1;

-- This works.

-- ============================================================
-- 4. OR DELETE THE PERSON
-- ============================================================

-- Another option is to delete the person
-- who is using the car.

DELETE FROM person
WHERE id = 2;

## -- Now car 1 is no longer referenced.

-- We can delete car 1:

DELETE FROM car
WHERE id = 1;

-- ============================================================
-- 5. WHY DOES POSTGRESQL STOP THE DELETE?
-- ============================================================

## -- Without this protection:

## -- person.car_id = 1

## -- could point to:

## -- car.id = 1

## -- after car 1 had been deleted.

## -- That would create a broken relationship.

-- The FOREIGN KEY prevents this.

-- ============================================================
-- 6. IMPORTANT
-- ============================================================

## -- By default, PostgreSQL uses:

## -- ON DELETE NO ACTION

-- This means PostgreSQL prevents deleting
-- a referenced row.

-- ============================================================
-- SUMMARY
-- ============================================================

-- If a row is referenced by a FOREIGN KEY,
-- PostgreSQL normally does not allow you to delete it.
-------------------------------------------------------

## -- You must first:

-- 1. Remove the foreign key value
--    from the child table
--------------------------

## -- OR

## -- 2. Delete the referencing row

## -- Then the parent row can be deleted.

## -- Example:

## -- person.car_id → car.id

-- person is the referencing/child table.
-- car is the referenced/parent table.
