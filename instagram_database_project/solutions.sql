-- 1. Finding 5 older users

SELECT * 
FROM users
ORDER BY created_at
LIMIT 5;

-- 2. Most popular registration date

SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC;

-- 3. Identify inactive users (users with no photos)

SELECT username
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- 4. Identify most popular photo and user that created it

SELECT 
    username,
    photos.id,
    photos.image_url,
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users    
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- 5. How many times does the average user post?

SELECT
    (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg;

-- 6. What are the 5 most used hashtags?

SELECT 
    tags.tag_name,
    COUNT(*) AS total
FROM photo_tags
JOIN tags 
    ON photo_tags.tag_id = tags.id 
GROUP BY tags.id 
ORDER BY total DESC
LIMIT 5;

-- 7. Finding Bots - users who have liked every single photo

SELECT 
    username,
    COUNT(*) AS num_likes
FROM users
INNER JOIN likes
    ON users.id = likes.user_id     
GROUP BY likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);