DROP TABLE IF EXISTS numeric_example;

CREATE TABLE numeric_example (
	accountId int4,
	transaction_amount NUMERIC, -- for fractional numbers.
	interest_rate DECIMAL(5, 3), -- DECIMAL is same as NUMERIC.  Personal preference: NUMERIC over DECIMAL
	balance NUMERIC(15), --- Scale can be left out which means it will be treated as 0
	tax_rate NUMERIC(4, -1) --- a negative scale will round the number x digits before decimal. Note that negative scale is allowed only for PostgreSQL > 15
);

INSERT INTO
	numeric_example (accountId, transaction_amount, interest_rate, balance, tax_rate)
VALUES
	(6, 1234512345123451234512345123451234512345123451234512345.678888888888888888888888888888888, 0.03561, 5000000000000, 17.25), -- Extremely large transaction with precise interest
	(7, 98765.43, 0.0450, 100000.345, 15.50), -- Another larger transaction with similar values
	(8, 15000.00, 0.0250, 25000, 28.00), -- Moderate transaction with updated values
	(9, 5000.50, 0.0150, 15000, 5.75), -- Small transaction with low tax rate
	(10, 75000.75, 0.0425, 350000, 4.50);

-- High transaction amount with a higher tax rate
SELECT
	*
FROM
	numeric_example;