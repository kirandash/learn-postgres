DROP TABLE IF EXISTS varchar_example;

-- character varying with bound
-- CREATE TABLE varchar_example (firstName character varying(255));
-- character varying without bound
-- CREATE TABLE varchar_example (firstName character varying);
-- character varying without bound is same as text
CREATE TABLE varchar_example (firstName text);

-- CHAR: Variable length, no padding
INSERT INTO varchar_example (firstName)
VALUES 
    ('John'),
    ('Alice'),
    ('Bob'),
    ('Catherine'),
    ('David');

SELECT
	*
FROM
	varchar_example;