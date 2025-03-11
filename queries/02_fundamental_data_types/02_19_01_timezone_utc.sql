show time zone;

SET time zone 'UTC';

SET time zone 'Europe/Rome';

SET time zone 'Asia/Singapore';

ALTER DATABASE master_postgres_demo SET TIME ZONE 'UTC'; 

show config_file;

select '2025-03-11 15:31:43+08:00'::timestamptz