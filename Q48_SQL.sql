CREATE DATABASE HI_TH;
USE HI_TH;


CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    name VARCHAR(255),
    available_from DATE
);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    book_id INT,
    quantity INT,
    dispatch_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);


INSERT INTO Books (book_id, name, available_from) VALUES
(1, 'Kalila And Demna', '2010-01-01'),
(2, '28 Letters', '2012-05-12'),
(3, 'The Hobbit', '2019-06-10'),
(4, '13 Reasons Why', '2019-06-01'),
(5, 'The Hunger Games', '2008-09-21');


INSERT INTO Orders (order_id, book_id, quantity, dispatch_date) VALUES
(1, 1, 5, '2018-07-01'),
(2, 2, 4, '2018-08-15'),
(3, 3, 7, '2019-04-01'),
(4, 3, 3, '2019-05-20'),
(5, 5, 1, '2018-03-10');



SELECT 
    b.book_id, 
    b.name
FROM 
    Books b
JOIN 
    Orders o ON b.book_id = o.book_id
WHERE 
    o.dispatch_date BETWEEN '2018-06-23' AND '2019-06-23'
    AND b.available_from <= DATE_SUB('2019-06-23', INTERVAL 1 MONTH)
GROUP BY 
    b.book_id, b.name
HAVING 
    SUM(o.quantity) < 10;
