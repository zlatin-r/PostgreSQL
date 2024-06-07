CREATE OR REPLACE PROCEDURE sp_transfer_money(sender_id INT, receiver_id INT, amount NUMERIC)
AS $$
    DECLARE curr_balance NUMERIC;

    BEGIN
        curr_balance := (SELECT balance FROM accounts WHERE id = sender_id);

        CALL sp_withdraw_money(sender_id, amount);
        CALL sp_deposit_money(receiver_id, amount);

        IF curr_balance < 0 THEN
            ROLLBACK;
        END IF;
END $$
LANGUAGE plpgsql;