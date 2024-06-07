CREATE TABLE IF NOT EXISTS notification_emails(
    id SERIAL PRIMARY KEY,
    recipient_id INT,
    subject VARCHAR(255),
    body VARCHAR(255)
);