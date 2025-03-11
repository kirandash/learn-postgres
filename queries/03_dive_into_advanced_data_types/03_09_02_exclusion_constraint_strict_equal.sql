DROP TABLE IF EXISTS exclusion_constraint_demo_employee_off_requests_2;

-- Enable btree_gist extension (only needs to be run once per database)
CREATE EXTENSION IF NOT EXISTS btree_gist;

-- table containing off requests from different employees
CREATE TABLE exclusion_constraint_demo_employee_off_requests_2(
	id BIGINT GENERATED ALWAYS as IDENTITY PRIMARY KEY,
	employee_id INTEGER NOT NULL,
	title text not null,
	-- We will cover TSRANGE in future video
	employee_off_period TSRANGE,
	-- We will cover GIST which is a type of index in future video
	-- This means a new task insertion will fail if we are trying to assign the task in employee_off_period
	EXCLUDE USING GIST (employee_id WITH =, employee_off_period WITH &&)
);

INSERT INTO exclusion_constraint_demo_employee_off_requests_2 (employee_id, title, employee_off_period)
VALUES 
    ('1', 'Vacation Leave', tsrange('2025-06-01 09:00:00', '2025-06-07 18:00:00', '[)')),
    ('2', 'Sick Leave', tsrange('2025-06-10 00:00:00', '2025-06-12 23:59:59', '[)')),
	-- it will not throw error because the overlap is between two different employees
    ('3','Paternal Leave', tsrange('2025-06-11 00:00:00', '2025-06-15 23:59:59', '[)'));
    -- The below command should fail because we don't allow overlap
    -- ('3','Paid Leave', tsrange('2025-06-13 00:00:00', '2025-06-15 23:59:59', '[)'));

SELECT * FROM exclusion_constraint_demo_employee_off_requests_2;