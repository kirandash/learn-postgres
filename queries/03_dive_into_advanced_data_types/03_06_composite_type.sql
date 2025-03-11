DROP TYPE IF EXISTS blogpost CASCADE;

CREATE TYPE blogpost as (
	title text,
	author text,
	category text[],
	tag text[],
	excerpt text
);

SELECT pg_typeof(ROW(
    'Learn PostgreSQL',  -- title
    'John Doe',          -- author
    ARRAY['Database', 'SQL'],  -- category (array of text)
    ARRAY['PostgreSQL', 'Learning'], -- tag (array of text)
    'An introductory guide to PostgreSQL' -- excerpt
)::blogpost);

DROP TABLE IF EXISTS composite_type_demo;

CREATE TABLE composite_type_demo(
	id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	article blogpost 
);

INSERT INTO composite_type_demo (article)
VALUES 
(
    ROW(
        'Learn PostgreSQL',          -- title
        'John Doe',                  -- author
        ARRAY['Database', 'SQL'],     -- category
        ARRAY['PostgreSQL', 'Guide'], -- tag
        'An introductory guide to PostgreSQL' -- excerpt
    )::blogpost
),
(
    ROW(
        'Advanced SQL Queries',
        'Alice Smith',
        ARRAY['SQL', 'Performance'],
        ARRAY['Optimization', 'Indexes'],
        'How to write efficient SQL queries'
    )::blogpost
);

SELECT * FROM composite_type_demo;

SELECT id, (article).title, (article).excerpt from composite_type_demo;