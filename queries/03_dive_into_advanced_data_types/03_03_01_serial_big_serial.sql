DROP TABLE IF EXISTS serial_demo;

CREATE TABLE serial_demo (
	id SERIAL
);
-- SERIAL Keyword behind the scenes:
CREATE SEQUENCE serial_example_data_type AS INTEGER;
CREATE TABLE serial_demo (
	id integer NOT NULL DEFAULT nextval('serial_example_data_type')
);
ALTER SEQUENCE serial_example_data_type OWNED BY serial_demo.id;

-- Use BIGSERIAL instead of SERIAL because we should not think about saving space for primary keys. as it is very much possible that we might run out of that space if our product becomes viral.
DROP TABLE IF EXISTS serial_demo;

CREATE TABLE serial_demo (
	id BIGSERIAL PRIMARY KEY
);