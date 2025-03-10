-- FALSE because en_US.UTF-8 is case sensitive
SELECT 'sourav' = 'SOURAV' COLLATE "en_US.UTF-8" AS result;

-- Custom Collation
CREATE COLLATION en_us_kiran (
	provider = icu, -- International Components for Unicode Provider
	locale = 'en-US-u-ks-level1', -- this will ignore case sensitiveness and accent as well
	DETERMINISTIC = false -- TODO: Do more research on how this impacts the query
);

SELECT 'é' = E'\u0065\u0301' COLLATE "en_us_kiran" AS result;