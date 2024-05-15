-- Active: 1715620302392@@127.0.0.1@3306@banco_de_dadosSELECT * FROM users

/* Between seleciona um range */
SELECT * FROM users 
WHERE created_at BETWEEN '2020-02-04 00:00:00' 
AND '2020-03-06 23:59:59' 
AND id BETWEEN 110 AND 174;