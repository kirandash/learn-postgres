SELECT * FROM indexing_demo_users limit 10;

SELECT * FROM indexing_demo_users where birthdate = '1982-08-26';

-- this will do a sequence scan on the table indexing_demo_users
-- postgres here is doing a parallel sequence scan and dedicating two workers for the scan
explain SELECT * FROM indexing_demo_users where birthdate = '1982-08-26';

-- Create index for birthdate col using btree
CREATE INDEX bdate on indexing_demo_users using btree(birthdate);

-- this will do a bitmap index scan on bdate
-- index will help us with strict equality check
explain SELECT * FROM indexing_demo_users where birthdate = '1982-08-26';

-- this will do a parallel seq scan because there is no index for this
explain SELECT * FROM indexing_demo_users where first_name = 'User4';

-- first bound or < also uses bitmap index scan
explain SELECT * FROM indexing_demo_users where birthdate < '1982-08-26';

-- second bound or > does not use bitmap index scan but runs a sequence scan
-- this is happening because of indexing selectivity
explain SELECT * FROM indexing_demo_users where birthdate > '1982-08-26';

-- bounded data will also run a bitmap index scan
explain SELECT * FROM indexing_demo_users where birthdate between '1982-08-26' and '1990-08-26';

-- ORDER - uses index scan as well. Note: here with index the data is already sorted hence sorting is not required
explain SELECT * FROM indexing_demo_users order by birthdate;

-- this runs a sorting logic and also a parallel seq scan with 2 workers
explain SELECT * FROM indexing_demo_users order by created_at;

-- GROUP
SELECT birthdate from indexing_demo_users GROUP BY birthdate;
-- parallel index scan and not a seq scan which is good
explain SELECT birthdate from indexing_demo_users GROUP BY birthdate;
