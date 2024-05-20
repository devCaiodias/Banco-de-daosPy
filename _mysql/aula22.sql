-- Active: 1715620302392@@127.0.0.1@3306@banco_de_dados
UPDATE users as u
JOIN profiles as p 
ON p.user_id = u.id
SET p.bio = CONCAT(p.bio, ' Atualizado')
WHERE u.fist_name = 'Madison';

SELECT u.fist_name, p.bio 
FROM users as u
JOIN profiles as p 
ON p.user_id = u.id
WHERE u.fist_name = 'Madison';