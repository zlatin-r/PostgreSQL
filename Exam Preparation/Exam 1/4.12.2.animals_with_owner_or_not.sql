CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(
    IN animal_name VARCHAR(30),
    OUT owner_name VARCHAR(30))
AS
$$
    BEGIN
        SELECT
            o.name
        INTO
            owner_name
        FROM
            animals AS a
        JOIN
            owners AS o
        ON
            a.owner_id = o.id
        WHERE
            a.name = animal_name;

        IF
            owner_name IS NULL THEN owner_name := 'For adoption';
        END IF;
    END;
$$
LANGUAGE plpgsql;


CALL sp_animals_with_owners_or_not('Hippo');
DROP PROCEDURE sp_animals_with_owners_or_not;
