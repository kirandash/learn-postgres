DROP TABLE IF EXISTS foreign_key_example_users CASCADE;

CREATE TABLE foreign_key_example_users (
	id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name TEXT,
	username TEXT UNIQUE,
	-- Composite unique constraint
	CONSTRAINT unique_id_username UNIQUE (id, username)
);

DROP TABLE IF EXISTS foreign_key_example_orders;

CREATE TABLE foreign_key_example_orders (
	id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	user_id BIGINT,
	user_username TEXT,
	name TEXT,
	-- Composite foreign key constraint
	FOREIGN KEY (user_id, user_username) REFERENCES foreign_key_example_users(id, username)
);

INSERT INTO foreign_key_example_users (name, username) values ('Kiran Dash', 'kirandash');

INSERT INTO foreign_key_example_orders (user_id, user_username, name) values (1, 'kirandash', 'grocery');

SELECT * FROM foreign_key_example_users;

SELECT * FROM foreign_key_example_orders;

