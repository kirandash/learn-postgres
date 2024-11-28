SELECT
	md5('Kiran Kumar Dash');

SELECT
	sha256('Kiran Kumar Dash');

-- text
SELECT
	pg_typeof(md5('Kiran Kumar Dash'));

-- bytea use decode hex to convert md5 text type to binary bytea
SELECT
	pg_typeof(decode(md5('Kiran Kumar Dash'), 'hex'));

-- 36, 20
SELECT
	pg_column_size(md5('Kiran Kumar Dash')),
	pg_column_size(decode(md5('Kiran Kumar Dash'), 'hex'));

-- bytea
SELECT
	pg_typeof(sha256('Kiran Kumar Dash'));

-- strict equality check with uuid
SELECT
	md5('Kiran Kumar Dash')::UUID
	-- 36, 20, 16 bytes
SELECT
	pg_column_size(md5('Kiran Kumar Dash')),
	pg_column_size(decode(md5('Kiran Kumar Dash'), 'hex')),
	pg_column_size(md5('Kiran Kumar Dash')::UUID);