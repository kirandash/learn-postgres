DROP TABLE IF EXISTS check_constraint_example;

-- firtname with max length of 10 characters, age should be > 0
-- CREATE TABLE check_constraint_example (firstName text, age integer CHECK (age > 0), savings numeric);
-- CREATE TABLE check_constraint_example (firstName text, age integer CONSTRAINT age_must_be_positive CHECK (age > 0), savings numeric);
CREATE TABLE check_constraint_example (
	-- this is a column constraint
	firstName text CONSTRAINT firstName_must_be_lt_10_chars CHECK (LENGTH(firstName) < 10),
	age integer CONSTRAINT age_must_be_positive CHECK (age > 0),
	-- this is a table constraint
	CONSTRAINT age_must_be_between_0_and_100 CHECK (age BETWEEN 0 AND 100),
	-- this is a column constraint
	fathersAge integer CONSTRAINT fathersAge_must_be_positive CHECK (age > 0),
	-- this is a table constraint
	CONSTRAINT fathersAge_must_be_between_0_and_100 CHECK (fathersAge BETWEEN 0 AND 100),
	savings numeric,
	-- these are table constraints
	CONSTRAINT fathers_age_must_be_gt_children_age CHECK (fathersAge > age)
);

INSERT INTO
	check_constraint_example (firstName, age, fathersAge, savings)
VALUES
	--     ('Alice', -30, 5000.75),
	('Alice', 30, 60, -5000.75),
	('Bob', 25, 55, 1000.50),
	('Catherine', 40, 70, 20000.00),
	('David', 35, 90, 15000.25),
	('Eve', 28, 77, 750.00);

SELECT
	*
FROM
	check_constraint_example;