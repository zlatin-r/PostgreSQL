CREATE TABLE students(
    id SERIAL PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE exams(
    id INT GENERATED ALWAYS AS IDENTITY (START WITH 100 INCREMENT BY 1) PRIMARY KEY ,
    exam_name VARCHAR(50)
);

CREATE TABLE study_halls(
    id SERIAL PRIMARY KEY,
    study_halls_name VARCHAR(50),
    exam_id INT,

    CONSTRAINT fk_exam_id_exams
    FOREIGN KEY (exam_id)
    REFERENCES exams (id)
);

CREATE TABLE students_exams(
    id SERIAL PRIMARY KEY,
    student_id INT,
    exam_id INT,

    CONSTRAINT fk_student_id_students
    FOREIGN KEY (student_id)
    REFERENCES students (id),

    CONSTRAINT fk_exam_id_exams
    FOREIGN KEY (exam_id)
    REFERENCES exams (id)
);

INSERT INTO students(student_name)
VALUES ('Mila'),
       ('Toni'),
       ('Ron');

INSERT INTO exams(exam_name)
VALUES ('Python'),
       ('Advanced'),
       ('Python OOP'),
       ('PostgreSQL');

INSERT INTO study_halls(study_halls_name, exam_id)
VALUES ('Open Source Hall', 102),
       ('Inspiration Hall', 101),
       ('Creative Hall', 103),
       ('Masterclass Hall', 103),
       ('Information Security Hall', 103);

INSERT INTO students_exams(student_id, exam_id)
VALUES (1, 101),
       (1, 102),
       (2, 101),
       (3, 103),
       (2, 102),
       (2, 103);