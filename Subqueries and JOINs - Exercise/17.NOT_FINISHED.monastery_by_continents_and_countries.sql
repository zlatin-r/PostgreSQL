UPDATE
    countries
SET
    country_name = 'Burma'
WHERE
    country_name = 'Myanmar';

INSERT INTO
    monasteries (monastery_name, country_code)
VALUES
    ('Hanga Abbey', (SELECT
                            country_code
                        FROM
                            countries
                        WHERE
                            country_name = 'Tanzania'));

SELECT
    cont.continent_name,
    coun.country_name,
    COUNT(mon.country_code) AS monasteries_count
FROM
    continents AS cont
JOIN
    countries AS coun
USING
    (continent_code)
LEFT JOIN
    monasteries AS mon
USING
    (country_code)
WHERE
    NOT three_rivers
GROUP BY
    coun.country_name,
    cont.continent_name
ORDER BY
    monasteries_count DESC,
    country_name;