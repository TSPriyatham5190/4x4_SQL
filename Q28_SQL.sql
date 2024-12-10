CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE Customers (
customer_id INT PRIMARY KEY,
name VARCHAR(255),
country VARCHAR(255)
);

CREATE TABLE Product (
product_id INT PRIMARY KEY,
description VARCHAR(255),
price INT
);

CREATE TABLE Orders (
order_id INT PRIMARY KEY,
customer_id INT,
product_id INT,
order_date DATE,
quantity INT,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
FOREIGN KEY (product_id) REFERENCES Product(product_id)
);


INSERT INTO Customers (customer_id, name, country) VALUES
(1, 'Winston', 'USA'),
(2, 'Jonathan', 'Peru'),
(3, 'Moustafa', 'Egypt');


INSERT INTO Product (product_id, description, price) VALUES
(10, 'LC Phone', 300),
(20, 'LC T-Shirt', 10),
(30, 'LC Book', 45),
(40, 'LC Keychain', 2);

INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity) VALUES
(1, 1, 10, '2020-06-10', 1),
(2, 1, 20, '2020-07-01', 1),
(3, 1, 30, '2020-07-08', 2),
(4, 2, 10, '2020-06-15', 2),
(5, 2, 40, '2020-07-01', 10),
(6, 3, 20, '2020-06-24', 2),
(7, 3, 30, '2020-06-25', 2),
(9, 3, 30, '2020-05-08', 3);


WITH MonthlySpending AS (
SELECT o.customer_id,
DATE_FORMAT(o.order_date, '%Y-%m') AS month,
SUM(p.price * o.quantity) AS total_spent
    
FROM Orders o
JOIN Product p ON o.product_id = p.product_id
WHERE o.order_date BETWEEN '2020-06-01' AND '2020-07-31'
GROUP BY o.customer_id, DATE_FORMAT(o.order_date, '%Y-%m')
),
EligibleCustomers AS (
SELECT customer_id
FROM MonthlySpending
WHERE 
(month = '2020-06' AND total_spent >= 100) OR 
(month = '2020-07' AND total_spent >= 100)
GROUP BY customer_id
HAVING COUNT(DISTINCT month) = 2
)
SELECT c.customer_id, c.name
FROM Customers c
JOIN EligibleCustomers e ON c.customer_id = e.customer_id;

