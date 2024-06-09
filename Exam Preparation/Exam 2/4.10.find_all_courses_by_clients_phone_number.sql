CREATE OR REPLACE FUNCTION fn_courses_by_client(phone_num VARCHAR(20))
RETURNS INT
LANGUAGE plpgsql
AS
$$
    DECLARE result INT;
    BEGIN
        SELECT
            COUNT(*)
        INTO result
        FROM
            clients AS cl
        JOIN
            courses AS co
        ON
            co.client_id = cl.id
        WHERE
            cl.phone_number = phone_num;
    RETURN result;
    END;
$$;

SELECT fn_courses_by_client('2(803) 638681');
SELECT fn_courses_by_client('(831) 1391236');
SELECT fn_courses_by_client('(704) 2502909');
