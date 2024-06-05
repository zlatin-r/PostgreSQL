CREATE OR REPLACE FUNCTION fn_full_name(first_name varchar, last_name varchar)
RETURNS varchar
AS
$$
    DECLARE full_name varchar;
    BEGIN
        full_name := INITCAP(first_name || ' ' || last_name);
        -- SELECT INITCAP(CONCAT(first_name, ' ', last_name))  INTO full_name;
        RETURN full_name;
    END;
$$
LANGUAGE plpgsql;

SELECT fn_full_name('fred', 'sanford');
SELECT fn_full_name('', 'SIMPSONS');

DROP FUNCTION IF EXISTS fn_full_name