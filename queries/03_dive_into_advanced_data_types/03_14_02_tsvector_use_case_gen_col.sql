-- Create table with TSVECTOR data type
DROP TABLE IF EXISTS ts_vector_demo;

CREATE TABLE ts_vector_demo(
	id BIGINT GENERATED ALWAYS as IDENTITY PRIMARY KEY,
	title text,
	-- make sure to mention the language even if it is english because GEN COLS only allow deterministic fn
	-- the following line will throw error because the fn is volatile and not deterministic
	-- search_vector_russian TSVECTOR GENERATED ALWAYS as (to_tsvector(title)) stored
	search_vector_russian TSVECTOR GENERATED ALWAYS as (to_tsvector('russian', title)) stored
);

INSERT INTO ts_vector_demo (title) VALUES
    ('Я люблю программирование'),    -- "I love programming"
    ('Погода сегодня прекрасная'),   -- "The weather is wonderful today"
    ('Москва - столица России'),     -- "Moscow is the capital of Russia"
    ('Я читаю интересную книгу'),    -- "I am reading an interesting book"
    ('Давайте поиграем в шахматы');  -- "Let's play chess"

-- Make sure to mention the search language in to_tsquery if it is not english
SELECT * FROM ts_vector_demo where search_vector_russian @@ to_tsquery('russian','Москва');