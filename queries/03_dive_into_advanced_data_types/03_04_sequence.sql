CREATE SEQUENCE bank_tx_id
	AS BIGINT
	INCREMENT 1
	START 30000
	MINVALUE 1
	MAXVALUE 9223372036854775807
	-- how many values should be cached before it goes and checks for the next update. by default cache is 1. and it's ok to leave with the default
	CACHE 1;

SELECT nextval('bank_tx_id')
SELECT currval('bank_tx_id')

SELECT setval('bank_tx_id', 20000);