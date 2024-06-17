SELECT
    start_point,
    end_point,
    leader_id,
    CONCAT(first_name, ' ', last_name)
FROM
    routes AS r
JOIN campers AS c
    ON r.leader_id = c.id;