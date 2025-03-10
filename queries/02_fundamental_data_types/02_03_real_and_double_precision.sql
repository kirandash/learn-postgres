DROP TABLE IF EXISTS floating_point_example;

CREATE TABLE floating_point_example (
	city_name text,
	temperatureMon real, -- real 4 bytes
	temperatureTue float4, -- real 4 bytes 
	temperatureWed float(24), -- real. Note: 1-24 is real with 6 set as precision while (25-53) onwards is double precision
	temperatureThur DOUBLE PRECISION, -- double precision
	temperatureFri float8, -- double precision
	temperatureSat float(49) -- double precision, if p is 25-53 it is a double precision with precision set to 15
);

INSERT INTO
	floating_point_example (city_name, temperatureMon, temperatureTue, temperatureWed, temperatureThur, temperatureFri, temperatureSat)
VALUES
	('New York', 21.57678878989, 22.3, 21.456789456789, 21.987654321987654321, 22.765432176543217654321, 22.123456789123456789),
	('Los Angeles', 25.0, 24.8434457, 25.123456, 24.98765432, 24.87654321, 25.0),
	('Chicago', 15.3, 15.5, 15.1234, 15.567890123, 15.67891234, 15.2),
	('Tokyo', 18.7, 18.9, 18.34567, 18.98765432, 18.87654321, 18.5),
	('London', 10.4, 10.6, 10.234567, 10.567890123, 10.87654321, 10.1);

SELECT
	*
FROM
	floating_point_example;