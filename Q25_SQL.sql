CREATE DATABASE ActivityDB;
USE ActivityDB;

CREATE TABLE Activity (
player_id INT,
device_id INT,
event_date DATE,
games_played INT,
PRIMARY KEY (player_id, event_date)
);

INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-05-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);

SELECT a.player_id, a.device_id
FROM Activity a
JOIN (SELECT player_id, MIN(event_date) AS first_login_date
     FROM Activity
     GROUP BY player_id) b
ON a.player_id = b.player_id AND a.event_date = b.first_login_date;


