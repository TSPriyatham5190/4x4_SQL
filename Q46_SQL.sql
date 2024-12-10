CREATE DATABASE HI_THER;
USE HI_THER;



CREATE TABLE Product (
    product_key INT PRIMARY KEY
);


CREATE TABLE Customer (
    customer_id INT,
    product_key INT,
    FOREIGN KEY (product_key) REFERENCES Product(product_key)
);


INSERT INTO Product (product_key) VALUES
(5),
(6);


INSERT INTO Customer (customer_id, product_key) VALUES
(1, 5),
(2, 6),
(3, 5),
(3, 6),
(1, 6);


SELECT 
    customer_id
FROM 
    Customer
GROUP BY 
    customer_id
HAVING 
    COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);

