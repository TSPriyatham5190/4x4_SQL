CREATE DATABASE My_db;
USE My_db;

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    team_id INT
);

INSERT INTO Employee (employee_id, team_id) VALUES
(1, 8),
(2, 8),
(3, 8),
(4, 7),
(5, 9),
(6, 9);

SELECT 
    e.employee_id,
    COUNT(e2.employee_id) AS team_size
FROM 
    Employee e
JOIN 
    Employee e2
ON 
    e.team_id = e2.team_id
GROUP BY 
    e.employee_id;
