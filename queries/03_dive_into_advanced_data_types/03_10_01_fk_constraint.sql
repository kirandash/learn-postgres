DROP TABLE IF EXISTS foreign_key_example_users CASCADE;

CREATE TABLE foreign_key_example_users (
	id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name TEXT
);

DROP TABLE IF EXISTS foreign_key_example_orders;

CREATE TABLE foreign_key_example_orders (
	id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	-- the type of foreign key must match the original id type
	user_id BIGINT REFERENCES foreign_key_example_users(id),
	name TEXT
);

INSERT INTO foreign_key_example_users (name) values ('kiran');

-- This will not work since 12 is not present in foreign_key_example_users
-- INSERT INTO foreign_key_example_orders (user_id, name) values (12, 'grocery');

INSERT INTO foreign_key_example_orders (user_id, name) values (1, 'grocery');

SELECT * FROM foreign_key_example_users;

SELECT * FROM foreign_key_example_orders;