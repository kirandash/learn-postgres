-- ctid will return the (page, position) of all the rows
SELECT *, ctid FROM unique_demo;

-- Don't use ctid to access data. This is not unique id. this because ctid can be changed by postgres. It's volatile and postgres can update it during cleanup etc
SELECT *, ctid FROM unique_demo WHERE ctid = '(0,5)';

-- index DS contains a `ctid` which acts as a pointer to the table