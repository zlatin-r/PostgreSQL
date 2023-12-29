SELECT 
	id AS "ID",
	CONCAT_WS(' ',
		first_name,
		middle_name,
		last_name
		) AS "Full Name",
	hire_date AS "Hire Date"
FROM 
	employees
ORDER BY
	"Hire Date"
OFFSET 9;
