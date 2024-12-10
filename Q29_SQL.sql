CREATE DATABASE TVProgramDB;
USE TVProgramDB;

CREATE TABLE TVProgram (
program_date DATE,
content_id INT,
channel VARCHAR(255),
PRIMARY KEY (program_date, content_id)
);

CREATE TABLE Content (
content_id INT PRIMARY KEY,
title VARCHAR(255),
Kids_content ENUM('Y', 'N'),
content_type VARCHAR(255)
);

INSERT INTO TVProgram (program_date, content_id, channel) VALUES
('2020-06-10', 1, 'LC-Channel'),
('2020-05-11', 2, 'LC-Channel'),
('2020-05-12', 3, 'LC-Channel'),
('2020-05-13', 4, 'Disney Ch'),
('2020-06-18', 4, 'Disney Ch'),
('2020-07-15', 5, 'Disney Ch');


INSERT INTO Content (content_id, title, Kids_content, content_type) VALUES
(1, 'Leetcode Movie', 'N', 'Movies'),
(2, 'Alg. for Kids', 'Y', 'Series'),
(3, 'Database Sols', 'N', 'Series'),
(4, 'Aladdin', 'Y', 'Movies'),
(5, 'Cinderella', 'Y', 'Movies');

SELECT DISTINCT c.title
FROM TVProgram t
JOIN Content c
ON t.content_id = c.content_id
WHERE c.Kids_content = 'Y' 
AND c.content_type = 'Movies' 
AND t.program_date BETWEEN '2020-06-01' AND '2020-06-30';

