-- Date and Time
-- PostgreSQL provides functions and operators
-- for working with dates and times.

-- NOW()
-- Returns the current date and time.

SELECT NOW();

-- Get only the date

SELECT NOW()::DATE;

-- Get only the time

SELECT NOW()::TIME;

-- Subtract time using INTERVAL

SELECT NOW() - INTERVAL '1 year';

SELECT NOW() - INTERVAL '5 years';

SELECT NOW() - INTERVAL '5 months';

-- Add time using INTERVAL

SELECT NOW() + INTERVAL '10 days';

SELECT NOW() + INTERVAL '10 months';

-- Convert the result to DATE

SELECT (NOW() + INTERVAL '10 months')::DATE;

-- DATE + INTERVAL

SELECT NOW()::DATE + INTERVAL '10 months';

-- Common intervals

-- '1 year'
-- '5 years'
-- '1 month'
-- '5 months'
-- '10 days'
-- '2 weeks'
-- '3 hours'
-- '30 minutes'

-- Notes
-- NOW() returns the current date and time.
-- ::DATE converts a value to a date.
-- ::TIME converts a value to a time.
-- INTERVAL is used to add or subtract a period of time.
-- + is used to add time.
-- - is used to subtract time.


'''
------- REMEMBER------- 

NOW()                  → current date + time
NOW()::DATE            → current date
NOW()::TIME            → current time
NOW() + INTERVAL       → future date/time
NOW() - INTERVAL       → past date/time
'''
