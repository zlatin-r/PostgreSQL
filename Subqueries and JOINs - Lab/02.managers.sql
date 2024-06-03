SELECT
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    d.department_id,
    d.name AS department_name
FROM
    employees AS e
JOIN departments AS d
    ON e.department_id = d.department_id
ORDER BY
    employee_id
LIMIT 5;