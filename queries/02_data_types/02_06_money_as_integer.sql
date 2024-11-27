-- SOLUTION 1 OF STORING MONEY: USING INTEGER (Used by Stripe and other financial platforms)
DROP TABLE IF EXISTS money_solution;

CREATE TABLE money_solution (accountId int8, balance int4, currency text);

-- save as cents for keeping track till 2 decimals
-- INSERT INTO
-- 	money_solution (accountId, balance, currency)
-- VALUES
-- 	(1, 100.50 * 100, 'USD'),
-- 	(2, 2000 * 100, 'USD'),
-- 	(3, 150.75 * 100, 'USD'),
-- 	(4, .789 * 100, 'USD'),
-- 	(5, 000.25888998 * 100, 'USD');
-- save as thousandth_cents for keeping track till 3 decimals

-- INSERT INTO
-- 	money_solution (accountId, balance, currency)
-- VALUES
-- 	(1, 100.50 * 1000, 'USD'),
-- 	(2, 2000 * 1000, 'USD'),
-- 	(3, 150.75 * 1000, 'USD'),
-- 	(4, .789 * 1000, 'USD'),
-- 	(5, 000.25888998 * 1000, 'USD');

-- save as ten_thousandth_cents for keeping track till 4 decimals
INSERT INTO
	money_solution (accountId, balance, currency)
VALUES
	(1, 100.50 * 10000, 'USD'),
	(2, 2000 * 10000, 'USD'),
	(3, 150.75 * 10000, 'USD'),
	(4, .789 * 10000, 'USD'),
	(5, 000.25888998 * 10000, 'USD');

SELECT
	*
FROM
	money_solution;