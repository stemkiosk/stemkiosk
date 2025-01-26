CREATE TABLE one (id int, colfloat float, colnumeric numeric, colunspecified, colstr str, colvarchar varchar(255));
PRAGMA table_info(one);

--<< INSERT INTO one (1, 2.12345678901234567890, 3.12345678901234567890, 0, "1111", "abcd");
-->>  OperationalError (SQLITE_ERROR): near "1": syntax error
INSERT INTO one VALUES (1, 2.12345678901234567890, 3.12345678901234567890, 0, "1111", "abcd");

SELECT * FROM one;
