DROP TABLE IF EXISTS small_integer_example;
  CREATE TABLE small_integer_example (
  username TEXT,
  age SMALLINT, -- why SMALLINT? age is normally 0 to 100+ so a nice range will be 0 to 1000 SMALLINT
  otp int2, -- 2 bytes, alias for SMALLINT
  zipCode int4, -- 4 bytes, alias for INTEGER
  phoneNumber int8, -- 8 bytes, alias for BIGINIT
  savings int8 -- 8 bytes, alias for BIGINIT
  );

  INSERT INTO small_integer_example (username, age, otp, zipCode, phoneNumber, savings)
  VALUES
  ('john_doe', 30, 1234, 560001, 987654321012345, 100000), -- A person in Bangalore with realistic phone and savings
  ('jane_smith', 25, 5678, 110001, 876543210987654, 200000), -- A person in Delhi
  ('sam_wilson', 45, 9012, 94016, 765432109876543, 50000), -- A person in California, USA
  ('lucy_brown', 19, 3456, 30301, 654321098765432, 75000), -- A young adult in Atlanta, Georgia
  ('mark_taylor', 50, 7890, 10001, 543210987654321, 150000); -- An older person in New York

  SELECT \* FROM small_integer_example;