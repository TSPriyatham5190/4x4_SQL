CREATE DATABASE NDBASE_A;
USE NDBASE_A;


CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);


CREATE TABLE EmployeeUNI (
    id INT,
    unique_id INT,
    PRIMARY KEY (id, unique_id),
    FOREIGN KEY (id) REFERENCES Employees(id)
);


INSERT INTO Employees (id, name) VALUES
(1, 'Alice'),
(7, 'Bob'),
(11, 'Meir'),
(90, 'Winston'),
(3, 'Jonathan');


INSERT INTO EmployeeUNI (id, unique_id) VALUES
(3, 1),
(11, 2),
(90, 3);

SELECT 
    e.name,
    eu.unique_id
FROM 
    Employees e
LEFT JOIN 
    EmployeeUNI eu ON e.id = eu.id
ORDER BY 
    e.name;

