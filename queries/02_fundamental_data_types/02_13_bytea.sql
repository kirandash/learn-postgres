DROP TABLE IF EXISTS bytea_example;

CREATE TABLE bytea_example (fileName TEXT, data BYTEA);

-- Inserting file with content "Kiran kumar dash" in hex format
INSERT INTO
	bytea_example (fileName, data)
VALUES
	('example.txt', '\x4b6972616e206b756d61722064617368');

SELECT
	*
FROM
	bytea_example;