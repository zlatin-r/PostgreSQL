CREATE OR REPLACE PROCEDURE sp_deposit_money(account_id INT, money_amount NUMERIC)
AS $$
    BEGIN
        UPDATE
            accounts
        SET
            balance = balance + money_amount
        WHERE
            accounts.id = account_id;
END $$
LANGUAGE plpgsql;

CALL sp_deposit_money(1, 200);