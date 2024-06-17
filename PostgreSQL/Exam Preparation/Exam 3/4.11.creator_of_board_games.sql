CREATE OR REPLACE FUNCTION fn_creator_with_board_games(creator_name VARCHAR(30))
RETURNS INT
AS
$$
    BEGIN
        RETURN (
            SELECT
        COUNT(*)
        FROM
            creators AS c
        JOIN
            creators_board_games AS cbg
        ON
            c.id = cbg.creator_id
        JOIN
            board_games AS bg
        ON
            bg.id = cbg.board_game_id
        WHERE
            c.first_name = creator_name
        );
    END;
$$
LANGUAGE plpgsql;

SELECT fn_creator_with_board_games('Bruno');
SELECT fn_creator_with_board_games('Alexander');