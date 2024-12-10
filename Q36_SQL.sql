CREATE DATABASE SQL_DB;
USE SQL_DB;


CREATE TABLE Users (
id INT PRIMARY KEY,
name VARCHAR(255)
);


CREATE TABLE Rides (
id INT PRIMARY KEY,
user_id INT,
distance INT,
FOREIGN KEY (user_id) REFERENCES Users(id)
);


INSERT INTO Users (id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Alex'),
(4, 'Donald'),
(7, 'Lee'),
(13, 'Jonathan'),
(19, 'Elvis');


INSERT INTO Rides (id, user_id, distance) VALUES
(1, 1, 120),
(2, 2, 317),
(3, 3, 222),
(4, 7, 100),
(5, 13, 312),
(6, 19, 50),
(7, 7, 120),
(8, 19, 400),
(9, 7, 230);


SELECT u.name,
COALESCE(SUM(r.distance), 0) AS travelled_distance
FROM Users u
LEFT JOIN Rides r ON u.id = r.user_id
GROUP BY u.id, u.name
ORDER BY travelled_distance DESC, u.name ASC;

