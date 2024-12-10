CREATE DATABASE N_DB;
USE N_DB;

CREATE TABLE Products (
product_id INT PRIMARY KEY,
product_name VARCHAR(255),
product_category VARCHAR(255)
);

CREATE TABLE Orders (
product_id INT,
order_date DATE,
unit INT,
FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products (product_id, product_name, product_category) VALUES
(1, 'Leetcode Solutions Book', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP Laptop', 'Laptop'),
(4, 'Lenovo Laptop', 'Laptop'),
(5, 'Leetcode Kit T-shirt', 'Clothing');

INSERT INTO Orders (product_id, order_date, unit) VALUES
(1, '2020-02-05', 120),
(2, '2020-02-10', 50),
(3, '2020-02-15', 200),
(4, '2020-02-20', 70),
(5, '2020-02-25', 150),
(1, '2020-02-10', 80),
(2, '2020-02-25', 60);


SELECT p.product_name, SUM(o.unit) AS total_units
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;
