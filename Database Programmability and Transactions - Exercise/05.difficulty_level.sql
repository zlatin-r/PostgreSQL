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
    RETURN level_is;
    END IF;
END;
$$
LANGUAGE plpgsql;