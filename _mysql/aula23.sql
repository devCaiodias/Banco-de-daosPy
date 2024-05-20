-- Active: 1715620302392@@127.0.0.1@3306@banco_de_dados
/* Apagando registros com join */
SELECT u.fist_name, p.bio 
FROM users as u
LEFT JOIN profiles as p 
ON p.user_id = u.id
WHERE u.fist_name = 'Madison';

DELETE p, u
FROM users as u
LEFT JOIN profiles as p 
ON p.user_id = u.id
WHERE u.fist_name = 'Madison';