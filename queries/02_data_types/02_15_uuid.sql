DROP TABLE IF EXISTS uuid_example;

CREATE TABLE uuid_example (
	-- Note that if we use text here the column size for unique_account_id will be 37 while for uuid it will be 16 bytes which is AWESOME!
	unique_account_id UUID
);

INSERT INTO
	uuid_example (unique_account_id)
VALUES
	('550e8400-e29b-41d4-a716-446655440000'), -- Example UUID
	('123e4567-e89b-12d3-a456-426614174000'), -- Example UUID
	(gen_random_uuid ()), -- Generate a random UUID
	('3f2504e0-4f89-11d3-9a0c-0305e82c3301'), -- Example UUID
	(gen_random_uuid ());

-- Generate another random UUID
SELECT
	*
FROM
	uuid_example;

SELECT
	unique_account_id,
	pg_typeof(unique_account_id),
	pg_column_size(unique_account_id)
FROM
	uuid_example;