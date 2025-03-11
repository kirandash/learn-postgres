DROP TABLE IF EXISTS exclusion_constraint_demo_employee_off_requests;

CREATE TABLE exclusion_constraint_demo_employee_off_requests(
	id BIGINT GENERATED ALWAYS as IDENTITY PRIMARY KEY,
	title text not null,
	-- We will cover TSRANGE in future video
	employee_off_period TSRANGE,
	-- We will cover GIST which is a type of index in future video
	-- This means a new task insertion will fail if we are trying to assign the task in employee_off_period
	EXCLUDE USING GIST (employee_off_period WITH &&)
);

INSERT INTO exclusion_constraint_demo_employee_off_requests (title, employee_off_period)
VALUES 
    ('Vacation Leave', tsrange('2025-06-01 09:00:00', '2025-06-07 18:00:00', '[)')),
    ('Sick Leave', tsrange('2025-06-10 00:00:00', '2025-06-12 23:59:59', '[)'));
-- The below one will cause conflict as the tsrange for this overlaps with the tsconfig above
--     ('Paternal Leave', tsrange('2025-06-11 00:00:00', '2025-06-15 23:59:59', '[)'));

SELECT * FROM exclusion_constraint_demo_employee_off_requests;