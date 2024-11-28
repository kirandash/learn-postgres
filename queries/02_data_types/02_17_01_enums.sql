DROP TABLE IF EXISTS enum_example;

DROP TYPE gh_status;

CREATE TYPE gh_status AS ENUM('on vacation', 'focusing', 'out sick', 'working from home');

ALTER TYPE gh_status
ADD VALUE 'working from office';

ALTER TYPE gh_status
ADD VALUE 'live streaming' before 'focusing';

ALTER TYPE gh_status
ADD VALUE 'hacking'
AFTER 'out sick';

CREATE TABLE enum_example (profile_status gh_status);

INSERT INTO
	enum_example (profile_status)
VALUES
	('on vacation'),
	('out sick'),
	('working from home'),
	('live streaming'),
	('working from office'),
	('hacking'),
	('focusing');

SELECT
	*
FROM
	enum_example;

-- This wil not order alphabetically but use the order of the ENUM
SELECT
	*
FROM
	enum_example
ORDER BY
	profile_status;