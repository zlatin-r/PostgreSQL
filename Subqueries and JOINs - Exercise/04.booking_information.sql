SELECT
    b.booking_id AS bookings,
    a.name AS apartment_owner,
    a.apartment_id AS apartments,
    c.first_name || ' ' || c.last_name -- returns <null> instead of empty string
        AS customer_name
FROM
    apartments AS a
FULL JOIN
    bookings AS b
USING
    (booking_id)
FULL JOIN
    customers AS c
USING
    (customer_id)
ORDER BY
    b.booking_id,
    apartment_owner,
    customer_name;