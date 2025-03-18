DROP TABLE IF EXISTS btree_demo_users;

CREATE TABLE btree_demo_users(
	id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name TEXT,
	email TEXT
);

INSERT INTO btree_demo_users (name, email) VALUES
    ('Alice Johnson', 'alice.johnson@example.com'),
    ('Bob Smith', 'bob.smith@example.com'),
    ('Charlie Brown', 'charlie.brown@example.com'),
    ('David Wilson', 'david.wilson@example.com'),
    ('Emma Davis', 'emma.davis@example.com'),
    ('Frank Miller', 'frank.miller@example.com'),
    ('Grace Lee', 'grace.lee@example.com'),
    ('Henry Martin', 'henry.martin@example.com'),
    ('Isabella White', 'isabella.white@example.com'),
    ('Jack Taylor', 'jack.taylor@example.com');

SELECT * FROM btree_demo_users;

-- indexes for name will be a B-Tree with all the names sorted at the bottom level or the leaf nodes. The name that we have indexed lives at the leaf nodes and also the ctid lives at the leaf nodes.

SELECT * FROm users where name = 'Jack Taylor';