CREATE DATABASE Assignment;
USE Assignment;


CREATE TABLE Departments (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);


CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(id)
);


INSERT INTO Departments (id, name) VALUES
(1, 'Electrical Engineering'),
(7, 'Computer Engineering'),
(13, 'Business Administration');


SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO Students (id, name, department_id) VALUES
(23, 'Alice', 1),
(1, 'Bob', 7),
(5, 'Jennifer', 13),
(2, 'John', 14),
(4, 'Jasmine', 77),
(3, 'Steve', 74),
(6, 'Luis', 1),
(8, 'Jonathan', 7),
(7, 'Daiana', 33),
(11, 'Madelynn', 1);

SET FOREIGN_KEY_CHECKS = 1;


SELECT s.id, s.name
FROM Students s
LEFT JOIN Departments d
ON s.department_id = d.id
WHERE d.id IS NULL;

