CREATE OR REPLACE PROCEDURE sp_customer_country_name(
    IN customer_full_name VARCHAR(50),
    OUT country_name VARCHAR(50)
)
AS
$$
    BEGIN
        SELECT
            cou.name
        INTO
            country_name
        FROM
            countries AS cou
        JOIN
            customers AS cus
        ON
            cus.country_id = cou.id
        WHERE
            CONCAT_WS(' ',cus.first_name, cus.last_name) = customer_full_name;
    END;
$$
LANGUAGE plpgsql;

CALL sp_customer_country_name('Jerry Andrews', '');