DROP TABLE IF EXISTS date_time_demo;

CREATE TABLE date_time_demo (
	birthday DATE,
	birthTime TIME,
	graduationTime timetz(3),
	weddingTime TIME WITH TIME ZONE,
	engagementTime TIME WITHOUT time zone
);

show datestyle;

SELECT '1/31/1994'::date, '09:03:05.1989944444'::time(3), '09:03:05.1989944444'::timetz;

select 'yesterday'::TIMESTAMP;

select 'tomorrow'::TIMESTAMP;

select 'epoch'::TIMESTAMP;

select 'infinity'::TIMESTAMP;

select 'allballs'::time;

select CURRENT_DATE, CURRENT_TIMESTAMP, current_time;
select LOCALTIME, LOCALTIMESTAMP;

select pg_typeof(CURRENT_DATE), pg_typeof(CURRENT_TIMESTAMP), pg_typeof(current_time);
select pg_typeof(LOCALTIME), pg_typeof(LOCALTIMESTAMP);