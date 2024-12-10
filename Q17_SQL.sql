CREATE DATABASE new_data_base;
USE new_data_base;

CREATE TABLE Product(
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
unit_price INT
);

CREATE TABLE Sales(
seller_id INT,
product_id INT,
buyer_id INT,
sale_date DATE,
quantity INT,
price INT,
FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Product (product_id, product_name, unit_price)
VALUES (1,'S8', 1000 ),
(2,'G4', 800 ),
(3,'Iphone', 1400 );

INSERT INTO Sales (seller_id, product_id, buyer_id, sale_date, quantity, price)
VALUES (1, 1, 1, '2019-01-21', 2, 2000 ),
(1, 2, 2, '2019-02-17', 2, 800 ),
(2, 2, 3, '2019-06-02', 2, 800 ),
(3, 3, 4, '2019-05-13', 2, 2800);

SELECT * FROM Product;

SELECT * FROM Sales;

SELECT Product.product_id, Product.product_name
FROM Product
WHERE Product.product_id NOT IN (
    SELECT Sales.product_id
    FROM Sales
    WHERE Sales.sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31'
)
AND Product.product_id IN (
    SELECT Sales.product_id
    FROM Sales
    WHERE Sales.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
);
