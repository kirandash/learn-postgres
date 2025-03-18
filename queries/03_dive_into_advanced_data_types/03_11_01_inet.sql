DROP TABLE IF EXISTS inet_demo;

CREATE TABLE inet_demo(
	id BIGINT GENERATED ALWAYS as IDENTITY PRIMARY KEY,
	ip INET
);

INSERT INTO inet_demo (ip) VALUES 
	('192.168.1.10/24'), -- Host with subnet
	('10.0.0.15'), -- Host without subnet
	('::1'), -- IPv6 loopback
	('2001:db8::/32'), -- IPv6 network
	('2001:db8::ff00:42:8329'), -- IPv6 host
	('192.168.0.0/16'), -- Private IPv4 network
	('8.8.8.8'), -- Public IPv4 address (Google DNS)
	('224.0.0.1'), -- IPv4 multicast
	('192.168.1.255'), -- IPv4 broadcast
	('fe80::1'), -- IPv6 link-local
	('::'); -- Unspecified IPv6 address
	
SELECT * FROM inet_demo;

-- Benefit of INET over TEXT
-- Size is smaller for inet compared to text
SELECT pg_column_size('2001:db8::ff00:42:8329'::text), pg_column_size('2001:db8::ff00:42:8329'::inet);

-- You can perform operations on ip if data type is INET
SELECT 
    ip, 
    host(ip) AS host_address,  -- Extracts the host portion (removes subnet mask)
    network(ip) AS network_address, -- Gets the network address
    inet_same_family(ip, '192.168.1.1'::inet) AS same_family_ipv4, -- Checks if same IPv4/IPv6 family
    abbrev(ip) AS abbreviated_format,  -- Shortened representation
    masklen(ip) AS mask_length, -- Subnet mask length
    broadcast(ip) AS broadcast_address, -- Gets broadcast address (for IPv4 only)
    set_masklen(ip, 24) AS new_mask_24, -- Changes subnet mask to /24
    set_masklen(ip, 32) AS new_mask_32 -- Changes subnet mask to /32
FROM inet_demo;