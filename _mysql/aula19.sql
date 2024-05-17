INSERT INTO users_roles (user_id, roles_id)
VALUES (118, 4);

SELECT user_id, roles_id FROM users_roles WHERE
user_id = 118 AND roles_id = 4;

SELECT id, 
(SELECT id FROM roles ORDER BY RAND() LIMIT 1) 
FROM users;


INSERT INTO users_roles (user_id, roles_id)
SELECT id, 
(SELECT id FROM roles ORDER BY RAND() LIMIT 1) 
FROM users;
