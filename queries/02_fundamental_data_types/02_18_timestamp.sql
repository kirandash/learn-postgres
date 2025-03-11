DROP TABLE IF EXISTS timestamp_without_timezone_example;

CREATE TABLE timestamp_without_timezone_example (
	"id" SERIAL PRIMARY KEY,
	"timestamp" TIMESTAMP WITHOUT time zone
);

DROP TABLE IF EXISTS timestamp_with_timezone_example;

CREATE TABLE timestamp_with_timezone_example (
	"id" SERIAL PRIMARY KEY,
	"timestamp" TIMESTAMP WITH time zone
	"timestamp2" timestamptz(6)
);

select now()::timestamptz(0), now()::timestamptz(1), now()::timestamptz, now()::timestamptz(6);

select now()::timestamptz(0), now()::timestamptz(1), now()::timestamptz, now()::timestamptz(6), date_trunc('second', now());

show DATESTYLE;

select now()::date;

select '1/3/2025';

set DATESTYLE = 'ISO, MDY';

set DATESTYLE = 'SQL, DMY';

select now();

select to_timestamp(1741676088);

select pg_typeof(to_timestamp(1741676088));