DROP TABLE IF EXISTS exclusion_constraint_demo_employee_off_requests_2;

-- Enable btree_gist extension (only needs to be run once per database)
CREATE EXTENSION IF NOT EXISTS btree_gist;

CREATE TYPE approval_status_enum AS ENUM ('approved', 'rejected');

-- table containing off requests from different employees
CREATE TABLE exclusion_constraint_demo_employee_off_requests_2(
	id BIGINT GENERATED ALWAYS as IDENTITY PRIMARY KEY,
	employee_id INTEGER NOT NULL,
	approval_status approval_status_enum NOT NULL,  -- Use ENUM typ
	title text not null,
	-- We will cover TSRANGE in future video
	employee_off_period TSRANGE,
	-- We will cover GIST which is a type of index in future video
	-- This means a new task insertion will fail if we are trying to assign the task in employee_off_period
	EXCLUDE USING GIST (employee_id WITH =, employee_off_period WITH &&) WHERE (approval_status != 'rejected')
);

INSERT INTO exclusion_constraint_demo_employee_off_requests_2 (employee_id, approval_status, title, employee_off_period)
VALUES 
    ('1', 'approved', 'Vacation Leave', tsrange('2025-06-01 09:00:00', '2025-06-07 18:00:00', '[)')),
    ('2', 'approved','Sick Leave', tsrange('2025-06-10 00:00:00', '2025-06-12 23:59:59', '[)')),
	-- it will not throw error because the overlap is between two different employees
    ('3','approved','Paternal Leave', tsrange('2025-06-11 00:00:00', '2025-06-15 23:59:59', '[)')),
    ('3','rejected','Paid Leave', tsrange('2025-06-13 00:00:00', '2025-06-15 23:59:59', '[)'));
--     The one below will fail because same employee can not have overlap for two approved leaves
--     ('3','approved','Paid Leave', tsrange('2025-06-13 00:00:00', '2025-06-15 23:59:59', '[)'));

SELECT * FROM exclusion_constraint_demo_employee_off_requests_2;