DROP TABLE IF EXISTS null_demo;

CREATE TABLE null_demo(
	id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	firstName text NOT NULL,
	middleName text NULL,
	lastName text NOT NULL,
	bankBalance numeric NOT NULL CHECK(bankBalance >= 0),
	email TEXT NOT NULL UNIQUE,
    secondaryEmail TEXT NULL
);