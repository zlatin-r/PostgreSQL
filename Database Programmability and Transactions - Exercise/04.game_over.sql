CREATE OR REPLACE FUNCTION fn_is_game_over(is_game_over BOOLEAN)
RETURNS TABLE(name VARCHAR(50), game_type_id INTEGER, is_finished BOOLEAN)
AS
$$
    BEGIN
        SELECT
            "name",
            game_type_id,
            is_finished
        FROM
            games
        WHERE
            is_finished = is_game_over;
    END;
$$
LANGUAGE plpgsql;

SELECT * FROM fn_is_game_over(true)
