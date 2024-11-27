DROP TABLE IF EXISTS infinity_nan_example;

CREATE TABLE infinity_nan_example (var numeric); -- numeric data type allows 'NaN' and 'Infinity' value but 'Infinity' will not be allowed if we set numeric bound ex: numeric(5,4)
-- CREATE TABLE infinity_nan_example (var integer); -- integer does not allow 'NaN' or 'Infinity' value
-- CREATE TABLE infinity_nan_example (var real);  -- real data type allows 'NaN' and 'Infinity' value
-- CREATE TABLE infinity_nan_example (var double precision); -- double precision data type allows 'NaN' and 'Infinity' value

-- INSERT INTO
-- 	infinity_nan_example (var)
-- VALUES
-- 	('NaN');

INSERT INTO
	infinity_nan_example (var)
VALUES
	('Infinity'); -- also allowed are 'inf', '-inf'


-- Note that if total number of digits are more than 8 then the INSERTION will fail
SELECT
	*
FROM
	infinity_nan_example;

-- NaN and inf comparison
select 'NaN'::numeric = 'NaN'::numeric -- TRUE, in js it is false
select '-inf'::numeric = '-inf'::numeric -- TRUE also same in javascript

-- sorting NaN and inf
select 'NaN'::numeric > 99999::numeric -- TRUE
select 'inf'::numeric > 99999::numeric -- TRUE

-- Math on inf
select 'inf'::numeric + 'inf'::numeric -- Infinity
select 'inf'::numeric - 'inf'::numeric -- NaN
select 'inf'::numeric + '200'::numeric -- Infinity
select 'inf'::numeric - '200'::numeric -- Infinity