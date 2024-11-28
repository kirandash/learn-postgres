DROP TABLE IF EXISTS domain_example;

CREATE DOMAIN sg_postal_code AS TEXT CONSTRAINT FORMAT CHECK (VALUE ~ '^\d{6}$');
-- Ex of zipcode for Singapore: 049310, 560134, Note that we should not use integer and numeric as you might loose the preceding zero

CREATE DOMAIN us_postal_code AS TEXT CONSTRAINT FORMAT CHECK (
	-- VALUE ~ '^\d{5}$' OR VALUE ~ '^\d{5}-\d{4}$' -- STANDARD OR EXTENDED Postal code ex: 12345 or 12345-6789
	VALUE ~ '^\d{5}(-\d{4})?$'
);

CREATE TABLE domain_example (firstName TEXT NOT NULL, lastName TEXT NOT NULL, zipCode sg_postal_code NOT NULL, usZipCode us_postal_code NOT NULL);

INSERT INTO domain_example (firstName, lastName, zipCode, usZipCode)
VALUES
    ('John', 'Doe', '049310', '12345'),
    ('Alice', 'Tan', '560134', '12345-6789'),
    ('Bob', 'Smith', '123456', '98765'),
    ('Catherine', 'Lee', '987654', '54321-1234'),
    ('David', 'Lim', '543210', '67890');

SELECT
	*
FROM
	domain_example;