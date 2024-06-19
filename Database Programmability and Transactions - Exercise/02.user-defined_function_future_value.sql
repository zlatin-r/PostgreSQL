CREATE OR REPLACE FUNCTION fn_calculate_future_value(
    initial_sum DECIMAL, yearly_interest_rate DECIMAl, number_of_years INT)
RETURNS DECIMAL
AS
$$
    BEGIN
        RETURN TRUNC(initial_sum * (POWER(1 + yearly_interest_rate, number_of_years)), 4);
    END;
$$
LANGUAGE plpgsql;

SELECT fn_calculate_future_value (1000, 0.1, 5);