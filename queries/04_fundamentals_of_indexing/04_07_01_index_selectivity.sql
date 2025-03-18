SELECT COUNT(DISTINCT birthdate) from indexing_demo_users;

-- AVERAGE SELECTIVITY EXAMPLE
-- calculate selectivity to determine if birthdate is good candidate for indexing
SELECT (COUNT(DISTINCT birthdate)::decimal / count(*)::decimal)::decimal(7, 4) from indexing_demo_users; -- 0.0150. The closer to 1 is better

-- BEST SELECTIVITY EXAMPLE
-- calculate selectivity to determine if primary key is good candidate for indexing
SELECT (COUNT(DISTINCT id)::decimal / count(*)::decimal)::decimal(7, 4) from indexing_demo_users;
-- 1.0000 which is the best scenario for selectivity

-- WORSE SELECTIVITY EXAMPLE
SELECT COUNT(DISTINCT is_premium) from indexing_demo_users; -- 2
SELECT (COUNT(DISTINCT is_premium)::decimal / count(*)::decimal)::decimal(7,10) from indexing_demo_users;
-- 0.000002

-- Use case where indexing is_premimum might be a good idea
SELECT COUNT(*) FILTER(WHERE is_premium is true) from indexing_demo_users; -- 199506

-- Example where adding index for is_premium is a good choice
-- Putting an index on is_premium when we might want to write a lot of query with the filter where is premium is true is required then indexing is_premium will be a good choice
SELECT (COUNT(*) FILTER(WHERE is_premium is true)::decimal / count(*)::decimal)::decimal(15,13) from indexing_demo_users; -- 0.1995060000000
