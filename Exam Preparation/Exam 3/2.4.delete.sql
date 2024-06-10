DELETE FROM
    addresses AS a
WHERE
    (SELECT address_id FROM publishers) = a.id