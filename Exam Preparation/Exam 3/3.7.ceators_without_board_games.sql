SELECT
    c.id,
    CONCAT_WS(' ', c.first_name, c.last_name) AS creator_name,
    c.email
FROM
    creators AS c
LEFT JOIN
    creators_board_games AS cbg
ON
    c.id = cbg.creator_id
WHERE
    board_game_id IS NULL
ORDER BY
    creator_name;