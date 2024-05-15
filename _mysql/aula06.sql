-- Active: 1715620302392@@127.0.0.1@3306@banco_de_dados
/* in seleciona elementos entre os valores enviados */
SELECT * FROM users 
WHERE id IN (103, 110, 115, 120, 125)
AND fist_name IN ('Caio', 'Minerva');