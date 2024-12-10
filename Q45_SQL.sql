CREATE DATABASE HI_THERE;
USE HI_THERE;


CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(255)
);


CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255),
    gender VARCHAR(10),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);



INSERT INTO Department (dept_id, dept_name) VALUES
(1, 'Engineering'),
(2, 'Science'),
(3, 'Law');


INSERT INTO Student (student_id, student_name, gender, dept_id) VALUES
(1, 'Jack', 'M', 1),
(2, 'Jane', 'F', 1),
(3, 'Mark', 'M', 2);


SELECT 
    D.dept_name,
    COUNT(S.student_id) AS student_number
FROM 
    Department D
LEFT JOIN 
    Student S
ON 
    D.dept_id = S.dept_id
GROUP BY 
    D.dept_id, D.dept_name
ORDER BY 
    student_number DESC, D.dept_name ASC;
