DROP TABLE IF EXISTS indexing_demo_users;

CREATE TABLE indexing_demo_users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    is_premium BOOLEAN DEFAULT FALSE,
    address TEXT,
    birthdate DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

-- Create a trigger to update `updated_at` automatically
CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_timestamp
BEFORE UPDATE ON indexing_demo_users
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

INSERT INTO indexing_demo_users (first_name, last_name, username, email, is_premium, address, birthdate)
SELECT
    'User' || s AS first_name,
    'Demo' || s AS last_name,
    'user' || s AS username,
    'user' || s || '@example.com' AS email,
    (random() < 0.2) AS is_premium, -- 20% premium users
    'Address ' || s AS address,
    DATE '1980-01-01' + (random() * 15000)::int AS birthdate -- Random birthdate within ~40 years
FROM generate_series(1, 1000000) s;

SELECT * FROM indexing_demo_users limit 10;

SELECT count(*) from indexing_demo_users;
