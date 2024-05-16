-- UPDATE - Atualiza registros
UPDATE users SET fist_name = 'Caio',
last_name = 'Dias'
WHERE id BETWEEN 109 AND 115;

SELECT * FROM users WHERE id BETWEEN 109 AND 115;