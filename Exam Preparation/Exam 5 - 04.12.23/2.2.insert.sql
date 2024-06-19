CREATE TABLE IF NOT EXISTS gift_recipients(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country_id INT NOT NULL,
    gift_sent BOOL DEFAULT FALSE
);

INSERT INTO gift_recipients (name, country_id, gift_sent)
SELECT
    CONCAT_WS(' ', first_name, last_name),
    country_id,
    CASE
        WHEN country_id IN (7,8,14,17,26) THEN TRUE
        ELSE FALSE
    END
FROM
    customers;