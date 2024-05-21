SELECT
    CONCAT('***', right(title, -3)) AS title
FROM
    books
WHERE
    SUBSTRING(title, 1, 3) = 'The';