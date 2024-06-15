SELECT
    p.id AS photo_id,
    COUNT(DISTINCT l.photo_id) AS likes_count,
    COUNT(DISTINCT c.photo_id) AS comments_count
FROM
    photos AS p
LEFT JOIN
    likes AS l
ON
    p.id = l.photo_id
LEFT JOIN
    comments AS c
ON
    p.id = c.photo_id
GROUP BY
    p.id
ORDER BY
    likes_count DESC,
    comments_count DESC,
    photo_id;