CREATE DATABASE ABC_DB;
USE ABC_DB;


CREATE TABLE Movies (
movie_id INT PRIMARY KEY,
title VARCHAR(255)
);


CREATE TABLE Users (
user_id INT PRIMARY KEY,
name VARCHAR(255)
);


CREATE TABLE MovieRating (
movie_id INT,
user_id INT,
rating INT,
created_at DATE,
PRIMARY KEY (movie_id, user_id),
FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
FOREIGN KEY (user_id) REFERENCES Users(user_id)
);



INSERT INTO Movies (movie_id, title) VALUES
(1, 'Avengers'),
(2, 'Frozen 2'),
(3, 'Joker');


INSERT INTO Users (user_id, name) VALUES
(1, 'Daniel'),
(2, 'Monica'),
(3, 'Maria'),
(4, 'James');

-- Insert data into the MovieRating table
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES
(1, 1, 3, '2020-01-12'),
(1, 2, 4, '2020-02-11'),
(1, 3, 2, '2020-02-12'),
(1, 4, 1, '2020-01-01'),
(2, 1, 5, '2020-02-17'),
(2, 2, 2, '2020-02-01'),
(2, 3, 2, '2020-03-01'),
(3, 1, 3, '2020-02-22'),
(3, 2, 4, '2020-02-25');

SELECT (SELECT name 
FROM Users WHERE user_id = (SELECT user_id FROM MovieRating 
GROUP BY user_id ORDER BY COUNT(DISTINCT movie_id) DESC, name ASC 
LIMIT 1)
) AS results,
    
(SELECT title FROM Movies WHERE movie_id = (
SELECT movie_id 
FROM MovieRating 
WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29' 
GROUP BY movie_id 
ORDER BY AVG(rating) DESC, title ASC 
LIMIT 1)
) AS results;


