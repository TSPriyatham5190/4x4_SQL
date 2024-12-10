CREATE DATABASE HI_THE;
USE HI_THE;


CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(255),
    experience_years INT
);


CREATE TABLE Project (
    project_id INT,
    employee_id INT,
    PRIMARY KEY (project_id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);


INSERT INTO Employee (employee_id, name, experience_years) VALUES
(1, 'Khaled', 3),
(2, 'Ali', 2),
(3, 'John', 3),
(4, 'Doe', 2);


INSERT INTO Project (project_id, employee_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4);


SELECT 
    p.project_id,
    p.employee_id
FROM 
    Project p
JOIN 
    Employee e ON p.employee_id = e.employee_id
WHERE 
    e.experience_years = (
        SELECT MAX(experience_years)
        FROM Employee
        WHERE employee_id IN (SELECT employee_id FROM Project WHERE project_id = p.project_id)
    );
