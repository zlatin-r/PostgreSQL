CREATE SEQUENCE passports_id_seq
START WITH 100
INCREMENT BY 1;

CREATE TABLE
    passports (
        id INT PRIMARY KEY DEFAULT nextval('passports_id_seq'),
        nationality VARCHAR(50)
);

INSERT INTO
    passports (
        nationality
)
VALUES ('N34FG21B'),
       ('K65LO4R7'),
       ('ZE657QP2');