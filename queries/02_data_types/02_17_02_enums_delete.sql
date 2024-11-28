DROP TABLE IF EXISTS enum_delete_example;

DROP TYPE IF EXISTS gh_status2;

CREATE TYPE gh_status2 AS ENUM('on vacation', 'focusing', 'out sick', 'working from home', 'neutral');

CREATE TABLE enum_delete_example (profile_status gh_status2);

INSERT INTO
	enum_delete_example (profile_status)
VALUES
	('on vacation'),
	('out sick'),
	('neutral'),
	('working from home'),
	('working from home'),
	('working from home'),
	('working from home'),
	('working from home'),
	('working from home'),
	('working from home'),
	('focusing');

-- Delete enums
DROP TYPE IF EXISTS gh_status_new;

CREATE TYPE gh_status_new AS ENUM('on vacation', 'focusing', 'out sick', 'neutral');

BEGIN;

UPDATE enum_delete_example
SET
	profile_status = 'neutral'
WHERE
	profile_status NOT IN ('on vacation', 'focusing', 'out sick', 'neutral');

ALTER TABLE enum_delete_example
ALTER COLUMN profile_status TYPE gh_status_new USING profile_status::text::gh_status_new;

COMMIT;

SELECT
	*
FROM
	enum_delete_example;