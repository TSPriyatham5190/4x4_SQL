CREATE DATABASE HELLLOOO;
USE HELLLOOO;


CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    department VARCHAR(255),
    managerId INT
);



INSERT INTO Employee (id, name, department, managerId) VALUES
(101, 'John', 'A', NULL),
(102, 'Dan', 'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy', 'A', 101),
(105, 'Anne', 'A', 101),
(106, 'Ron', 'B', 101);


SELECT 
    E1.name AS name
FROM 
    Employee E1
JOIN 
    Employee E2
ON 
    E1.id = E2.managerId
GROUP BY 
    E1.id, E1.name
HAVING 
    COUNT(E2.id) >= 5;

