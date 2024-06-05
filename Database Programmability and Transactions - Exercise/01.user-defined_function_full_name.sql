CREATE OR REPLACE FUNCTION fn_full_name(first_name varchar, last_name varchar)
RETURNS varchar
AS
$$
    DECLARE full_name varchar;
    BEGIN
        SELECT(CONCAT(first_name, ' ', last_name))  INTO full_name;
        RETURN INITCAP(full_name);
    END;
$$
LANGUAGE plpgsql;

SELECT fn_full_name('fred', 'sanford');
SELECT fn_full_name('', 'SIMPSONS')