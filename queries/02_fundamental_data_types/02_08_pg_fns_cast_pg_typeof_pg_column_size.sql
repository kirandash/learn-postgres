-- cast operator
SELECT 98765::money;

-- cast fn
SELECT cast(98765 as money);

-- to check type of data using pg_typeof
SELECT 
pg_typeof(98765),
pg_typeof(cast(98765 as money));

-- type casting using literal
SELECT integer '98765';

SELECT 
pg_typeof(integer '98765'); -- integer


SELECT real '98765';

SELECT 
pg_typeof(real '98765'); -- real

-- pg_column_size
SELECT
pg_column_size(98765); --4

SELECT
pg_column_size(32767::int2); --2

SELECT
pg_column_size(32767::int8); --8

SELECT
pg_column_size(32767::numeric); -- 10

SELECT
pg_column_size(32767.8234234234792342349::numeric); -- 20

