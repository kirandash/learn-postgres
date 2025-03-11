DROP TABLE IF EXISTS unique_demo;

CREATE TABLE unique_demo(
	-- unique by default
	id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- this is unique and not null by default
	firstName text NOT NULL,
	middleName text NULL,
	lastName text NOT NULL,
	bankBalance numeric NOT NULL CHECK(bankBalance >= 0),
	-- Unique use case 1
	email TEXT UNIQUE NOT NULL,
	-- Rare case where we want only one NULL and it should be unique
	-- 	email TEXT UNIQUE NULLS NOT DISTINCT,
  	secondaryEmail TEXT NULL,
  	youtubeChannelName TEXT NULL,
  	-- Unique use case 2
  	UNIQUE(firstName, youtubeChannelName),
  	-- constraint with constraint name for better error logging
  	username TEXT NOT NULL constraint must_be_unique UNIQUE
);

INSERT INTO unique_demo (firstName, lastName, email, bankBalance, username)
VALUES 
('John', 'Doe', 'john.doe@example.com', 1000, 'johndoe'),
('Jane', 'Smith', 'jane.smith@example.com', 1500, 'janesmith'),
('Alice', 'Johnson', 'alice.johnson@example.com', 2000, 'alice');

-- This insertion will fail since email is not unique
-- INSERT INTO unique_demo (firstName, lastName, email, bankBalance)
-- VALUES 
-- ('Kiran', 'Dash', 'john.doe@example.com', 789);

INSERT INTO unique_demo (firstName, lastName, email, bankBalance, youtubeChannelName, username)
VALUES 
('Kiran', 'Doe', 'kirandash@test.com', 1000, 'BG Web Agency', 'kiran'),
('Kiran', 'Smith', 'kirandash@test2.com', 1500, 'BG Web Agency2', 'kiran2');

SELECT * FROM unique_demo;