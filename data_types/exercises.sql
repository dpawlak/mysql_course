-- Print current time
SELECT CURTIME();

-- Print current date
SELECT CURDATE();

-- Print current day of the week number
SELECT DAYOFWEEK(CURDATE());

-- Print current day of the week name
SELECT DATE_FORMAT(NOW(), '%W');

-- Print out the current day and time in this format mm/dd/yyyy
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');

-- Print out the current day and time using this format: January 2nd at 3:15
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

-- Create a tweets table that stores:
-- the tweet content, a username and time it was created
CREATE TABLE tweets (
    content VARCHAR(140),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO tweets (content, username) VALUES 
('this is my first tweet', 'daniel');
