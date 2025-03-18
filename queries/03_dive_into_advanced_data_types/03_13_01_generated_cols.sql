DROP TABLE IF EXISTS generated_cols_demo;

CREATE TABLE generated_cols_demo(
	-- here age_years and age_months are not descrete info. they have the same info but in two different formats
	-- 	age_years numeric,
	-- 	age_months numeric
	age_years numeric,
	age_months numeric GENERATED ALWAYS AS (age_years * 12) STORED
);

INSERT INTO generated_cols_demo (age_years) values (32);

-- Manually writing to GENERATED COLUMNS is not allowed
-- INSERT INTO generated_cols_demo (age_years, age_months) values (32, 384);
-- We can use DEFAULT if necessary
INSERT INTO generated_cols_demo (age_years, age_months) values (32, DEFAULT);

SELECT * FROM generated_cols_demo;