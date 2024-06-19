CREATE TABLE search_results
(
    id            SERIAL PRIMARY KEY,
    address_name  VARCHAR(50),
    full_name     VARCHAR(100),
    level_of_bill VARCHAR(20),
    make          VARCHAR(30),
    condition     CHAR(1),
    category_name VARCHAR(50)
);

CREATE OR REPLACE PROCEDURE sp_courses_by_address(address_name VARCHAR(100))
AS
$$
    BEGIN
        TRUNCATE search_results;

        INSERT INTO search_results
        (
            address_name,
            full_name,
            level_of_bill,
            make,
            condition,
            category_name
        )

        SELECT
            address_name,
            cl.full_name,
            CASE
                WHEN co.bill <= 20 THEN 'Low'
                WHEN co.bill <= 30 THEN 'Medium'
                ELSE 'High'
            END AS level_of_bill,
            ca.make,
            ca.condition,
            ct.name
        FROM
            addresses AS ad
        JOIN
            courses AS co
        ON
            co.from_address_id = ad.id
        JOIN
            cars AS ca
        ON
            co.car_id = ca.id
        JOIN
            categories AS ct
        ON
            ca.category_id = ct.id
        JOIN
            clients AS cl
        ON
            co.client_id = cl.id
        WHERE
            ad.name = address_name
        ORDER BY
            ca.make,
            cl.full_name;
    END;
$$
LANGUAGE plpgsql;

CALL sp_courses_by_address('700 Monterey Avenue');
SELECT * FROM search_results;