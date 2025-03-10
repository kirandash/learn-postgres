DROP TABLE IF EXISTS money_example;

CREATE TABLE money_example (accountId int8, balance money);

-- INSERT INTO
-- 	money_example (accountId, balance)
-- VALUES
-- 	(1, 100.50),
-- 	(2, 2000),
-- 	(3, '$150.75'),
-- 	(4, .789),
-- 	(5, '$1,000.25888998');
INSERT INTO
	money_example (accountId, balance)
VALUES
	(1, 100.50),
	(2, 2000),
	(3, '£150.75'),
	(4, .789),
	(5, '1,000.25888998');

SELECT
	*
FROM
	money_example;

-- To change the currency symbol we can SET lc_monetary
SHOW lc_monetary;

-- SET lc_monetary = 'en_us.UTF-8';
SET
	lc_monetary = 'en_GB.UTF-8';