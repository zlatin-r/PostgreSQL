SELECT
    concat_ws(
    ' ',
    name,
    state
    ) AS "Cities Information",
    area AS "Area (km2)"
FROM
    cities;