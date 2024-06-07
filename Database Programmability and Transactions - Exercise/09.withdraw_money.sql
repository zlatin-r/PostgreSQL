CREATE OR REPLACE PROCEDURE sp_withdraw_money(account_id INT, money_amount NUMERIC)
AS $$
    DECLARE account_amount NUMERIC;
    BEGIN
        account_amount := (SELECT balance FROM accounts AS a WHERE a.id = account_id);

        IF
            account_amount < money_amount
        THEN
            RAISE NOTICE
                'Insufficient balance to withdraw %', account_amount;
        ELSE
            UPDATE
                accounts
            SET
                balance = balance - money_amount
            WHERE
                accounts.id = account_id;
        END IF;
END $$
LANGUAGE plpgsql;

CALL sp_withdraw_money(1, 200);