\set ECHO none
SET client_min_messages = warning;
SET DATESTYLE TO ISO;
SET client_encoding = utf8;
\pset null '<NULL>'
\set ECHO all

DROP FUNCTION dbms_output_test();
DROP TABLE dbms_output_test;

-- DBMS_OUTPUT.DISABLE [0]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	stts	INTEGER;
BEGIN
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1');
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT * FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.PUT_LINE [1]
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff1	VARCHAR(20) := 'orafce';
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('t');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE');
	PERFORM DBMS_OUTPUT.PUT_LINE (buff1);
	PERFORM DBMS_OUTPUT.PUT ('ABC');
	PERFORM DBMS_OUTPUT.PUT_LINE ('');
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.PUT_LINE [2]
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('t');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORA
F
CE');
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.PUT [1]
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff1	VARCHAR(20) := 'ora';
	buff2	VARCHAR(20) := 'f';
	buff3	VARCHAR(20) := 'ce';
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('t');
	PERFORM DBMS_OUTPUT.PUT ('ORA');
	PERFORM DBMS_OUTPUT.PUT ('F');
	PERFORM DBMS_OUTPUT.PUT ('CE');
	PERFORM DBMS_OUTPUT.PUT_LINE ('');
	PERFORM DBMS_OUTPUT.PUT ('ABC');
	PERFORM DBMS_OUTPUT.PUT_LINE ('');
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.PUT [2]
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('t');
	PERFORM DBMS_OUTPUT.PUT ('ORA
F
CE');
	PERFORM DBMS_OUTPUT.PUT_LINE ('');
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.GET_LINE [1]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	stts	INTEGER;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 2');
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT * FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.GET_LINE [2]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	stts	INTEGER;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 2');
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 3');
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT * FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.GET_LINE [3]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	stts	INTEGER;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 2');
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.PUT ('ORA');
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT * FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.GET_LINE [4]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	stts	INTEGER;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 2');
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.NEW_LINE();
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT * FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.GET_LINE [5]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	stts	INTEGER;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1
');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 2');
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT REPLACE(buff, '
', '<LF>') FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.GET_LINE [6]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	stts	INTEGER;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORA
F
CE');
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT regexp_replace(buff, E'\n', '<LF>', 'g') FROM dbms_output_test limit 1;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.GET_LINES [1]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	buff1	VARCHAR(20);
	buff2	VARCHAR(20);
	buff3	VARCHAR(20);
	stts	INTEGER := 10;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 2');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 3');
	SELECT INTO buff1,buff2,buff3,stts lines[1],lines[2],lines[3],numlines FROM DBMS_OUTPUT.GET_LINES(stts);
	INSERT INTO dbms_output_test VALUES (buff1, stts);
	INSERT INTO dbms_output_test VALUES (buff2, stts);
	INSERT INTO dbms_output_test VALUES (buff3, stts);
	SELECT INTO buff,stts lines[1],numlines FROM DBMS_OUTPUT.GET_LINES(stts);
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT * FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.GET_LINES [2]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	buff1	VARCHAR(20);
	buff2	VARCHAR(20);
	stts	INTEGER := 2;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 2');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 3');
	SELECT INTO buff1,buff2,stts lines[1],lines[2],numlines FROM DBMS_OUTPUT.GET_LINES(stts);
	INSERT INTO dbms_output_test VALUES (buff1, stts);
	INSERT INTO dbms_output_test VALUES (buff2, stts);
	SELECT INTO buff,stts lines[1],numlines FROM DBMS_OUTPUT.GET_LINES(stts);
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT * FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.GET_LINES [3]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	stts	INTEGER := 1;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 2');
	SELECT INTO buff,stts lines[1],numlines FROM DBMS_OUTPUT.GET_LINES(stts);
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 3');
	SELECT INTO buff,stts lines[1],numlines FROM DBMS_OUTPUT.GET_LINES(stts);
	INSERT INTO dbms_output_test VALUES (buff, stts);
	SELECT INTO buff,stts lines[1],numlines FROM DBMS_OUTPUT.GET_LINES(stts);
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT * FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.GET_LINES [4]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	stts	INTEGER := 1;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 2');
	SELECT INTO buff,stts lines[1],numlines FROM DBMS_OUTPUT.GET_LINES(stts);
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.PUT ('ORA');
	SELECT INTO buff,stts lines[1],numlines FROM DBMS_OUTPUT.GET_LINES(stts);
	INSERT INTO dbms_output_test VALUES (buff, stts);
	SELECT INTO buff,stts lines[1],numlines FROM DBMS_OUTPUT.GET_LINES(stts);
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT * FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.GET_LINES [5]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	stts	INTEGER := 1;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 2');
	SELECT INTO buff,stts lines[1],numlines FROM DBMS_OUTPUT.GET_LINES(stts);
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.NEW_LINE();
	SELECT INTO buff,stts lines[1],numlines FROM DBMS_OUTPUT.GET_LINES(stts);
	INSERT INTO dbms_output_test VALUES (buff, stts);
	SELECT INTO buff,stts lines[1],numlines FROM DBMS_OUTPUT.GET_LINES(stts);
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT * FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.GET_LINES [6]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	stts	INTEGER := 1;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORA
F
CE');
	SELECT INTO buff,stts lines[1],numlines FROM DBMS_OUTPUT.GET_LINES(stts);
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT regexp_replace(buff, E'\n', '<LF>', 'g') FROM dbms_output_test limit 1;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.NEW_LINE [1]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff1	VARCHAR(20);
	buff2	VARCHAR(20);
	stts	INTEGER := 10;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.PUT ('ORA');
	PERFORM DBMS_OUTPUT.NEW_LINE();
	PERFORM DBMS_OUTPUT.PUT ('FCE');
	PERFORM DBMS_OUTPUT.NEW_LINE();
	SELECT INTO buff1,buff2,stts lines[1],lines[2],numlines FROM DBMS_OUTPUT.GET_LINES(stts);
	INSERT INTO dbms_output_test VALUES (buff1, stts);
	INSERT INTO dbms_output_test VALUES (buff2, stts);
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT * FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.NEW_LINE [2]
CREATE TABLE dbms_output_test (buff VARCHAR(3000), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff1	VARCHAR(3000);
	stts	INTEGER := 10;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.ENABLE(2000);
	FOR j IN 1..1999 LOOP
		PERFORM DBMS_OUTPUT.PUT ('A');
	END LOOP;
	PERFORM DBMS_OUTPUT.NEW_LINE();
	SELECT INTO buff1,stts lines[1],numlines FROM DBMS_OUTPUT.GET_LINES(stts);
	INSERT INTO dbms_output_test VALUES (buff1, stts);
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT buff FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.DISABLE [1]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	stts	INTEGER;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1');
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);

	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 2');
	PERFORM DBMS_OUTPUT.ENABLE();
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 3');
	PERFORM DBMS_OUTPUT.DISABLE();
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.ENABLE();

	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.PUT ('ORAFCE TEST 4');
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.NEW_LINE();
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);

	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.PUT ('ORAFCE TEST 5');
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.NEW_LINE();
	PERFORM DBMS_OUTPUT.ENABLE();
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);

	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT * FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.DISABLE [2]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	stts	INTEGER := 10;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1');
	SELECT INTO buff,stts lines[1],numlines FROM DBMS_OUTPUT.GET_LINES(stts);
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT * FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.ENABLE [1]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	status	INTEGER;
	num		INTEGER := 2000;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('t');
	PERFORM DBMS_OUTPUT.ENABLE(2000);
	PERFORM DBMS_OUTPUT.PUT ('ORAFCE TEST 1');
	PERFORM DBMS_OUTPUT.NEW_LINE();
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT * FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.ENABLE [2]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	stts	INTEGER;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1');
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.PUT ('ORAFCE TEST 2');
	PERFORM DBMS_OUTPUT.NEW_LINE();
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT * FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.ENABLE [3]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	stts	INTEGER := 10;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1');
	SELECT INTO buff,stts lines[1],numlines FROM DBMS_OUTPUT.GET_LINES(stts);
	INSERT INTO dbms_output_test VALUES (buff, stts);

END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT * FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.ENABLE [4]
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('t');
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	FOR j IN 1..2000 LOOP
		PERFORM DBMS_OUTPUT.PUT ('A');
	END LOOP;
	PERFORM DBMS_OUTPUT.NEW_LINE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.ENABLE [5]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	stts	INTEGER;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE(NULL);
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1');
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT * FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- DBMS_OUTPUT.ENABLE [6]
CREATE TABLE dbms_output_test (buff VARCHAR(20), status INTEGER);
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
DECLARE
	buff	VARCHAR(20);
	stts	INTEGER;
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1');
	PERFORM DBMS_OUTPUT.ENABLE();
	SELECT INTO buff,stts line,status FROM DBMS_OUTPUT.GET_LINE();
	INSERT INTO dbms_output_test VALUES (buff, stts);
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
SELECT * FROM dbms_output_test;
DROP TABLE dbms_output_test;
DROP FUNCTION dbms_output_test();

-- SERVEROUTPUT [1]
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1');
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
DROP FUNCTION dbms_output_test();

CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
BEGIn
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('t');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 2');
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
DROP FUNCTION dbms_output_test();

-- SERVEROUTPUT [2]
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.PUT ('ORAFCE TEST 1');
	PERFORM DBMS_OUTPUT.NEW_LINE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
DROP FUNCTION dbms_output_test();

CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('t');
	PERFORM DBMS_OUTPUT.PUT ('ORAFCE TEST 2');
	PERFORM DBMS_OUTPUT.NEW_LINE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
DROP FUNCTION dbms_output_test();

-- SERVEROUTPUT [3]
CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('f');
	PERFORM DBMS_OUTPUT.DISABLE();
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
DROP FUNCTION dbms_output_test();

CREATE FUNCTION dbms_output_test() RETURNS VOID AS $$
BEGIN
	PERFORM DBMS_OUTPUT.DISABLE();
	PERFORM DBMS_OUTPUT.ENABLE();
	PERFORM DBMS_OUTPUT.SERVEROUTPUT ('t');
	PERFORM DBMS_OUTPUT.PUT_LINE ('ORAFCE TEST 1');
END;
$$ LANGUAGE plpgsql;
SELECT dbms_output_test();
DROP FUNCTION dbms_output_test();
