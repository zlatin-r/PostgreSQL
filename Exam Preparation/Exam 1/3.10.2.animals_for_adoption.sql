SELECT
    a.name AS animal,
    EXTRACT ('year' FROM a.birthdate) AS birth_year,
    at.animal_type
FROM
    animals AS a
JOIN
    animal_types AS at
ON
    a.animal_type_id = at.id
WHERE
    AGE('01/01/2022', a.birthdate) < '5 years'
    AND
    a.owner_id IS NULL
    AND
    at.animal_type <> 'Birds'
ORDER BY
    a.name;