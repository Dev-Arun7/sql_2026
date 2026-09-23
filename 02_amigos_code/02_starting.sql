-- Open PostgreSQL shell from Linux terminal
sudo -u postgres psql

-- List all databases
\l

-- Create a database
CREATE DATABASE test;

-- Connect to the database
\c test

-- Show tables
\d

-- Exit PostgreSQL
\q


-- Note: if you have any permission issue while reading any files
psql -U postgres -h localhost -d test
-- Then provide sql password