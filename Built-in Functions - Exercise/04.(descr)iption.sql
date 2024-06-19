SELECT
    RIGHT(description, -4) AS "substring"   -- SUBSTRING(description FROM 5) AS "substring"
FROM
    currencies;