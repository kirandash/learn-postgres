DROP TABLE IF EXISTS character_example;

CREATE TABLE character_example (firstName char(10));

-- CHAR: Fixed length, padded with spaces
INSERT INTO
	character_example (firstName)
VALUES
	('John'),
	('Alice'),
	('Bob'),
	('Catherine'),
	('David');

SELECT
	*
FROM
	character_example;