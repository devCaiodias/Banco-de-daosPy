-- Active: 1715620302392@@127.0.0.1@3306@banco_de_dados
SELECT u.id as uid, p.id as pid, p.bio, u.fist_name
FROM users as u
RIGHT JOIN profiles as p
ON u.id = p.user_id
;

/* DELETE FROM profiles WHERE id BETWEEN 521 AND 523; */