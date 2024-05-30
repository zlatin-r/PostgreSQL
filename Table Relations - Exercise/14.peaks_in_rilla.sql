SELECT
    mountain_range,
    peak_name,
    elevation
FROM
    peaks
JOIN
    mountains
ON
    peaks.mountain_id = mountain_id;