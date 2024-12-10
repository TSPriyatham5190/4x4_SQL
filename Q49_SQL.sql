CREATE DATABASE HI_T;
USE HI_T;



CREATE TABLE Enrollments (
    student_id INT,
    course_id INT,
    grade INT,
    PRIMARY KEY (student_id, course_id)
);


INSERT INTO Enrollments (student_id, course_id, grade)
VALUES
    (2, 2, 95),
    (2, 3, 95),
    (1, 1, 90),
    (1, 2, 99),
    (3, 1, 80),
    (3, 2, 75),
    (3, 3, 82);


SELECT 
    e.student_id, 
    e.course_id, 
    e.grade
FROM 
    Enrollments e
JOIN 
    (SELECT student_id, MAX(grade) AS max_grade
     FROM Enrollments
     GROUP BY student_id) AS max_grades
ON 
    e.student_id = max_grades.student_id 
    AND e.grade = max_grades.max_grade
ORDER BY 
    e.student_id ASC, 
    e.course_id ASC;
