SELECT
    ap.account_id || ' ' ||username,
    email
FROM
    accounts AS a
JOIN
    accounts_photos AS ap
ON
    a.id = ap.account_id
JOIN
    photos AS p
ON
    p.id = ap.photo_id
WHERE
    account_id = photo_id
ORDER BY
    ap.account_id
