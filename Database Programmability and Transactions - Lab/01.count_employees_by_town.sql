CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name VARCHAR(20))
RETURNS INT
AS
$$
    DECLARE result INT;
    BEGIN
        SELECT COUNT(employee_id) INTO result
        FROM employees AS e
        JOIN addresses AS a ON a.address_id = e.address_id
        JOIN towns as t ON t.town_id = a.town_id
        WHERE t.name = town_name;
        RETURN result;
    END;

$$
LANGUAGE plpgsql;

SELECT fn_count_employees_by_town('Sofia') AS count;
SELECT fn_count_employees_by_town('Berlin') AS count;
SELECT fn_count_employees_by_town(NULL) AS count;