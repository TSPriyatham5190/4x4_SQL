CREATE DATABASE HI_THERO;
USE HI_THERO;

CREATE TABLE Players (
    player_id INT PRIMARY KEY,
    group_id INT
);

CREATE TABLE Matches (
    match_id INT PRIMARY KEY,
    first_player INT,
    second_player INT,
    first_score INT,
    second_score INT,
    FOREIGN KEY (first_player) REFERENCES Players(player_id),
    FOREIGN KEY (second_player) REFERENCES Players(player_id)
);

INSERT INTO Players (player_id, group_id)
VALUES 
    (15, 1),
    (25, 1),
    (30, 1),
    (45, 1),
    (10, 2),
    (35, 2),
    (50, 2),
    (20, 3),
    (40, 3);
    
INSERT INTO Matches (match_id, first_player, second_player, first_score, second_score)
VALUES
    (1, 15, 25, 5, 4),
    (2, 25, 30, 3, 0),
    (3, 30, 45, 2, 5),
    (4, 45, 15, 3, 3),
    (5, 10, 35, 2, 5),
    (6, 35, 50, 5, 5),
    (7, 50, 10, 3, 3),
    (8, 20, 40, 5, 4);
    
    
WITH PlayerScores AS (
    -- Calculate total goals scored by each player
    SELECT 
        p.group_id,
        p.player_id,
        SUM(CASE 
            WHEN m.first_player = p.player_id THEN m.first_score
            WHEN m.second_player = p.player_id THEN m.second_score
            ELSE 0 
        END) AS total_goals
    FROM Players p
    LEFT JOIN Matches m
        ON m.first_player = p.player_id OR m.second_player = p.player_id
    GROUP BY p.group_id, p.player_id
)
-- Get the player with the highest score for each group, resolving ties with the smallest player_id
SELECT ps.group_id, ps.player_id
FROM PlayerScores ps
WHERE ps.total_goals = (
    -- Subquery to find the maximum total goals in each group
    SELECT MAX(total_goals)
    FROM PlayerScores
    WHERE group_id = ps.group_id
)
ORDER BY ps.group_id, ps.player_id;
