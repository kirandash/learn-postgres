show time zone;

select 
	'2025-03-11 15:31:43'::timestamptz as utc,
	'2025-03-11 15:31:43'::timestamptz at time zone 'Asia/Singapore' as singapore,
	'2025-03-11 15:31:43'::timestamptz at time zone 'CST' as cst,
	'2025-03-11 15:31:43'::timestamptz at time zone 'CDT' as cdt,
	'2025-03-11 15:31:43'::timestamptz at time zone '-06:00' as offset6Wrong,
	'2025-03-11 15:31:43'::timestamptz at time zone '-05:00' as offfset5Wrong,
	'2025-03-11 15:31:43'::timestamptz at time zone interval '-06:00' as offfset6Correct,
	'2025-03-11 15:31:43'::timestamptz at time zone interval '-05:00' as offfset5Correct,
	'2025-03-11 15:31:43'::timestamptz at time zone '+06:00' as offset6Correct,
	'2025-03-11 15:31:43'::timestamptz at time zone '+05:00' as offfset5Correct;

SELECT * FROM pg_timezone_names;

SELECT * FROM pg_timezone_names WHERE name like 'Asia%';

SELECT * FROM pg_timezone_names WHERE name like '%Singapore';