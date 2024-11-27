-- SOLUTION 2 OF STORING MONEY: USING NUMERIC (Used by finance institutions where precision is important)
DROP TABLE IF EXISTS money_solution_numeric;

CREATE TABLE money_solution_numeric (accountId int8, balance NUMERIC(8, 4), currency text);

INSERT INTO
	money_solution_numeric (accountId, balance, currency)
VALUES
	(1, 100.50, 'USD'),
	(2, 2000, 'USD'),
	(3, 150.75, 'USD'),
	(4, .789, 'USD'),
	(5, 000.25888998, 'USD'), -- this will be saved as 0.2589
	(6, 16.123456, 'USD');

-- Note that if total number of digits are more than 8 then the INSERTION will fail
SELECT
	*
FROM
	money_solution_numeric;