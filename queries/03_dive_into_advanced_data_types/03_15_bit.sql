SELECT B'1001', pg_typeof(B'1001'), '1001'::BIT(4), pg_typeof('1001'::BIT(4));

-- check the list of features enabled for a particular user
-- 1001 list of features (bit)
-- 0001 list of features for a user (bit mask)
SELECT B'1001' & B'0001'; -- will return 0001 which means 4th feature is enabled for user

DROP TABLE IF EXISTS bit_varying_demo;

CREATE TABLE bit_varying_demo(
	feature_flag_trial_period bit(6),
	feature_flag_pro bit varying(32)
);

INSERT INTO bit_varying_demo (feature_flag_trial_period, feature_flag_pro) VALUES
    (B'101010', B'11001100110011001100110011001100'), -- 6-bit and 32-bit values
    (B'000001', B'1010'), -- Shorter bit varying (allowed)
    (B'111111', B'11110000111100001111'); -- Another bit pattern
    
SELECT * FROM bit_varying_demo;
