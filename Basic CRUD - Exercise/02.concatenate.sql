SELECT
	CONCAT_WS(' ',
		name,
		state) AS "Cities Iformation",
	area AS "Area (km2)"
FROM 
	cities
    