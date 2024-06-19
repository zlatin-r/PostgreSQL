SELECT
    v.name as voluneers,
    v.phone_number,
    (regexp_matches(v.address, '[0-9].*'))[1]
    -- or TRIM(v.address, 'Sofia, ')
FROM
    volunteers AS v
JOIN
    volunteers_departments AS vd
ON
    v.department_id = vd.id
WHERE
    v.address LIKE '%Sofia%'
    AND
    vd.department_name = 'Education program assistant'
ORDER BY
    v.name;