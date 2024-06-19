SELECT
    first_name,
    last_name,
    EXTRACT('Year' FROM born) AS year
FROM
    authors;