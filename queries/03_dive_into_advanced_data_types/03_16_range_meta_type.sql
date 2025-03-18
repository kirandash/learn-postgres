-- range has two styles: [] and () which defines whether the lower bound and power bound are included or excluded respectively
SELECT '[100,200]'::int4range; -- [100,201) which means the valid values here are 100 till 200

SELECT '[100,200]'::numrange; -- [100,200] which means the valid values here are 100 till 200

-- for numrange there is no discrete steps while int4range has discrete steps that's why int4range is represented with [) and numrange with []
-- the same logic is also applied for daterange and timestamp range where daterange has discrete steps while timestamp is a continuous data type with no discrete steps

SELECT int4range(100,200); -- [100, 200)
-- Explicitly mention the bounds
SELECT int4range(100,200, '(]'); -- [101, 201)

DROP TABLE IF EXISTS range_demo;

CREATE TABLE range_demo(
	id BIGINT GENERATED ALWAYS as IDENTITY PRIMARY KEY,
	age_range INT4RANGE,
	salary_range NUMRANGE,
	birthdate_range DATERANGE,
	birthtime_range TSRANGE
);

INSERT INTO range_demo (age_range, salary_range, birthdate_range, birthtime_range) VALUES
    ('[25,35)', '[50000,100000]', '[1990-01-01, 2000-12-31]', '[2023-03-01 08:00, 2023-03-01 18:00]'),
    ('(30,50]', '[70000,120000]', '[1985-05-10, 1995-05-10]', '[2023-03-02 09:00, 2023-03-02 17:30]'),
    ('[18,65)', '[30000,150000]', '[1975-01-01, 2005-12-31]', '[2023-03-03 07:30, 2023-03-03 19:00]');

SELECT * FROM range_demo;

-- the operator '@>' is used to check if a range contains a value
SELECT * FROM range_demo WHERE age_range @> 19;

-- we can use operator '&&' to check if a range overlaps with another range
SELECT * FROM range_demo WHERE salary_range && '[20000, 30000)'; -- no rows returned

SELECT * FROM range_demo WHERE salary_range && '[20000, 50000]'; -- two rows returned

-- we can use '*' operator to find the intersection of range between two ranges
SELECT int4range(18,65, '[)') * int4range(30,50, '(]'); -- [31,51)

-- programmatically fetch bound
SELECT UPPER(int4range(18,65,'[)')), UPPER_INC(int4range(18,65,'[)'));

-- Multi range with several upper and lower bounds which is non contiguous range
SELECT '{[18,25), [32,67)}'::int4multirange; -- {[18,25),[32,67)}

SELECT '{[18,25), [32,67)}'::int4multirange @> 19; -- true

SELECT '{[18,25), [32,67)}'::int4multirange @> 67; -- false