DROP TABLE IF EXISTS identity_demo;

CREATE TABLE identity_demo(
	id BIGINT GENERATED ALWAYS as IDENTITY,
	firstName TEXT,
	lastName TEXT
);

INSERT INTO identity_demo (firstName, lastName) 
VALUES 
    ('John', 'Doe'),
    ('Alice', 'Smith'),
    ('Bob', 'Johnson');

-- To override the default primary key generation use OVERRIDING SYSTEM VALUE
-- This will only insert the value 9 but won't move the sequence to 9. hence we might end up with two rows with id 9
INSERT INTO identity_demo (id, firstName, lastName) 
OVERRIDING SYSTEM VALUE VALUES 
    (9, 'Kiran', 'Dash');

-- To reset the sequence first you can get the current sequence
SELECT pg_get_serial_sequence('identity_demo', 'id');
-- and then reset the sequence to the new value
SELECT setval('public.identity_demo_id_seq', (select max(id) from identity_demo));

INSERT INTO identity_demo (firstName, lastName) 
VALUES 
    ('Sourav', 'B'),
    ('Sourav', 'C'),
    ('Sourav', 'D'),
    ('Sourav', 'E'),
    ('Sourav', 'F'),
    ('Sourav', 'G');

-- If you have to put id then you can use DEFAULT
INSERT INTO identity_demo (id, firstName, lastName) 
VALUES 
    (DEFAULT, 'Mark', 'C');
    
SELECT * FROM identity_demo;

