DROP TABLE IF EXISTS generated_cols_demo_usecase;

CREATE TABLE generated_cols_demo_usecase(
	phone_number text,
	country_code text GENERATED ALWAYS AS (substring(phone_number FROM '^(\+\d+)')) STORED
);

-- This is not efficient as some country has multiple dashes
-- SELECT split_part('+65-99993333', '-', 1);

SELECT substring('+65-99993333' FROM '^(\+\d+)');

INSERT INTO generated_cols_demo_usecase (phone_number) VALUES
    ('+1-555-1234'),      -- USA/Canada
    ('+91-9876543210'),   -- India
    ('+44-7700-900123'),  -- UK
    ('+65-81234567'),     -- Singapore
    ('+33-6-12-34-56-78'), -- France
    ('+49-30-12345678'),  -- Germany
    ('+81-90-1234-5678'), -- Japan
    ('+86-138-0013-8000'); -- China

SELECT * FROM generated_cols_demo_usecase;