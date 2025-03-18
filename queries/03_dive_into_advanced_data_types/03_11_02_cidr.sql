DROP TABLE IF EXISTS cidr_demo;

CREATE TABLE cidr_demo(
	id BIGINT GENERATED ALWAYS as IDENTITY PRIMARY KEY,
	-- Use CIDR when you want to work with ranges
	network CIDR
);

INSERT INTO cidr_demo (network) VALUES 
    ('192.168.1.0/24'), -- Private IPv4 network
    ('10.0.0.0/8'), -- Large private IPv4 network
    ('172.16.0.0/12'), -- Private IPv4 network
    ('2001:db8::/32'), -- IPv6 documentation network
    ('2001:db8:abcd::/48'), -- IPv6 block
    ('::/128'); -- IPv6 unspecified address block
    
SELECT * FROM cidr_demo;