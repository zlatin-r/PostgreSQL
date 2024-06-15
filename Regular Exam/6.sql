SELECT
    c.photo_id,
    p.capture_date,
    p.description,
    COUNT(*) AS comments_count
FROM
    photos AS p
JOIN
    comments AS c
ON
    p.id = c.photo_id
WHERE
    p.description IS NOT NULL
GROUP BY
    c.photo_id,
    p.capture_date,
    p.description
ORDER BY
    comments_count DESC,
    c.photo_id
LIMIT 3;