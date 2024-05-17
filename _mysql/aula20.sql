INSERT IGNORE INTO users_roles (user_id, roles_id)
SELECT id, 
(SELECT id FROM roles ORDER BY RAND() LIMIT 1) 
FROM users ORDER BY RAND() LIMIT 5;