-- see all enums
SELECT
	*
FROM
	pg_catalog.pg_enum
	-- see all enums for a particular enum id and also ordered
SELECT
	*
FROM
	pg_catalog.pg_enum
WHERE
	enumtypid = 17311
ORDER BY
	enumsortorder;

-- get full range
SELECT
	enum_range(NULL::gh_status2);

-- to get a range from a start and end value
SELECT
	enum_range('out sick'::gh_status2, 'neutral'::gh_status2);