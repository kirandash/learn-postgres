-- This code will generate series of numbers under num column from 10 till 30
-- SELECT * FROM generate_series(10, 30) num;
-- SMALLINT DATA TYPES SPEED (SUPER FAST) 3 ms
SELECT
	sum(num::SMALLINT / (num + 1))::SMALLINT -- We are testing the speed by running a mathematical operation on the number by casting the number to a specific data type and also casting the result
FROM
	generate_series(1, 10000000) num;

-- INTEGER 190 µs
SELECT
	sum(num::INTEGER / (num + 1))::INTEGER
FROM
	generate_series(1, 10000000) num;

-- BIGINT: 191 µs
SELECT
	sum(num::BIGINT / (num + 1))::BIGINT
FROM
	generate_series(1, 10000000) num;


-- REAL DATA TYPES SPEED (FASTER) 200 µs
SELECT
	sum(num::REAL / (num + 1))::REAL
FROM
	generate_series(1, 10000000) num;


-- DOUBLE PRECISION DATA TYPES SPEED (FAST) 1.451 s
SELECT
	sum(num::DOUBLE PRECISION / (num + 1))::DOUBLE PRECISION
FROM
	generate_series(1, 10000000) num;


-- NUMERIC DATA TYPES SPEED (SLOW) 2.647 s
SELECT
	sum(num::NUMERIC / (num + 1))::NUMERIC
FROM
	generate_series(1, 10000000) num;