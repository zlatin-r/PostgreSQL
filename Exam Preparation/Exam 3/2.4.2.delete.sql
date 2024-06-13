DELETE FROM
    board_games
WHERE id IN ()

DELETE FROM
    publishers
WHERE id IN (SELECT id FROM addresses WHERE town LIKE 'L%');

DELETE FROM
    addresses
WHERE
    town LIKE 'L%;'