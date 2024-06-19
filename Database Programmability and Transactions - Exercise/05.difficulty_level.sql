CREATE OR REPLACE FUNCTION fn_difficulty_level(points INT)
RETURNS VARCHAR
AS

$$
DECLARE
    level_is VARCHAR(50);
BEGIN
    IF points <= 40 THEN level_is := 'Normal Difficulty';
    ELSEIF points <= 60 THEN level_is := 'Nightmare Difficulty';
    ELSE level_is := 'Hell Difficulty';
    END IF;
    RETURN level_is;
END;
$$

LANGUAGE plpgsql;

SELECT
    user_id,
    level,
    cash,
    fn_difficulty_level(level)
FROM
    users_games
ORDER BY
    user_id;