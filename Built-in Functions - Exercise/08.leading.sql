SELECT
    continent_name,
    LTRIM(continent_name)  -- TRIM(LEADING FROM continent_name) AS "trim"
FROM
    continents;