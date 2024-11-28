DROP TABLE IF EXISTS boolean_example;

CREATE TABLE boolean_example (isActive BOOLEAN);

INSERT INTO
	boolean_example (isActive)
VALUES
	(TRUE), -- Boolean TRUE
	(FALSE), -- Boolean FALSE
	('1'),
	('0'),
	('on'),
	('off'),
	('yes'),
	('no'),
	('t'),
	('f'), -- All above is TRUE, FALSE
	(NULL);

-- NULL
-- Boolean NULL
SELECT
	*
FROM
	boolean_example;

SELECT
	pg_typeof('1'::boolean);

SELECT
	pg_column_size('1'::boolean);