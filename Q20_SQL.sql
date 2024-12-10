CREATE DATABASE cttr;
USE cttr;

CREATE TABLE Ads (
    ad_id INT,
    user_id INT,
    action ENUM('Clicked', 'Viewed', 'Ignored'),
    PRIMARY KEY (ad_id, user_id)
);

INSERT INTO Ads (ad_id, user_id, action) VALUES
(1, 1, 'Clicked'),
(2, 2, 'Clicked'),
(3, 3, 'Viewed'),
(5, 5, 'Ignored'),
(1, 7, 'Ignored'),
(2, 7, 'Viewed'),
(3, 5, 'Clicked'),
(1, 4, 'Viewed'),
(2, 11, 'Viewed'),
(1, 2, 'Clicked');

SELECT 
    ad_id,
    ROUND(
        (SUM(CASE WHEN action = 'Clicked' THEN 1 ELSE 0 END) * 100.0) /
        NULLIF(SUM(CASE WHEN action IN ('Clicked', 'Viewed') THEN 1 ELSE 0 END), 0),
        2
    ) AS ctr
FROM 
    Ads
GROUP BY 
    ad_id
ORDER BY 
    ctr DESC, ad_id ASC;



