-- Active: 1715620302392@@127.0.0.1@3306@banco_de_dados
/* Where filtra registros */
/* Operadores de comparação: = < <= > >= <> !=*/
/* Operadores: logicos and e or */
SELECT * FROM users
WHERE created_at > '2024-05-15 13:40:21' AND fist_name="bob" AND password_hash=15547;