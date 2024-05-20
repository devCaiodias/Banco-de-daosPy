SELECT fist_name, COUNT(id) as total FROM users
GROUP BY fist_name  
ORDER BY total DESC;

SELECT u.fist_name, COUNT(u.id) as total
FROM users as u
LEFT JOIN profiles as p 
ON p.user_id = u.id
WHERE u.id IN (109, 110, 111)
GROUP BY fist_name
ORDER BY total DESC
LIMIT 5;