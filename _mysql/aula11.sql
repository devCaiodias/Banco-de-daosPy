/* DELETE apaga registros da tabela */
DELETE FROM users WHERE id BETWEEN 103 AND 108;

/* AVISO: use SELECT para garantir que está apagando os valores corretos */
SELECT * FROM users
WHERE id BETWEEN 103 AND 108;