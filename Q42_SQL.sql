CREATE DATABASE HEL;
USE HEL;


CREATE TABLE Sales (
    sale_date DATE,
    fruit ENUM('apples', 'oranges'),
    sold_num INT,
    PRIMARY KEY (sale_date, fruit)
);


INSERT INTO Sales (sale_date, fruit, sold_num) VALUES
('2020-05-01', 'apples', 10),
('2020-05-01', 'oranges', 8),
('2020-05-02', 'apples', 15),
('2020-05-02', 'oranges', 15),
('2020-05-03', 'apples', 20),
('2020-05-03', 'oranges', 0),
('2020-05-04', 'apples', 15),
('2020-05-04', 'oranges', 16);


SELECT 
    sale_date,
    SUM(CASE WHEN fruit = 'apples' THEN sold_num ELSE -sold_num END) AS diff
FROM 
    Sales
GROUP BY 
    sale_date
ORDER BY 
    sale_date;
