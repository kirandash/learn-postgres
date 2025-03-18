DROP TABLE IF EXISTS foreign_key_example_users CASCADE;

CREATE TABLE foreign_key_example_users (
	id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name TEXT
);

DROP TABLE IF EXISTS foreign_key_example_orders;

CREATE TABLE foreign_key_example_orders (
	id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	user_id BIGINT,
	name TEXT,
	FOREIGN KEY (user_id) REFERENCES foreign_key_example_users(id) on delete restrict
);

INSERT INTO foreign_key_example_users (name) values ('Kiran Dash');

INSERT INTO foreign_key_example_orders (user_id, name) values (1, 'grocery');

SELECT * FROM foreign_key_example_users;

SELECT * FROM foreign_key_example_orders;

-- The following DELETE will be restricted because we have on delete restrict on the fk constraint
DELETE FROM foreign_key_example_users;