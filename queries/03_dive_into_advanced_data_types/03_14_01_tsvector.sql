-- to_tsvector will create a sorted distinct list of lexemes
SELECT pg_typeof(to_tsvector('kiran dash is an awesome full stack developer who is also an awesome human being')), to_tsvector('kiran dash is an awesome full stack developer');

-- This will convert our query word into a queriable lexeme
SELECT to_tsquery('awesome');

-- And then we can pass it to search on our main document

-- true
SELECT to_tsvector('kiran dash is an awesome full stack developer who is also an awesome human being') @@ to_tsquery('kiran');

-- false because 'is' does not have a lexeme
SELECT to_tsvector('kiran dash is an awesome full stack developer who is also an awesome human being') @@ to_tsquery('is');

-- false because word does not exist
SELECT to_tsvector('kiran dash is an awesome full stack developer who is also an awesome human being') @@ to_tsquery('India');

-- Searching in a different language
SELECT to_tsvector('russian', 'Я люблю есть яблоки и бананы.');