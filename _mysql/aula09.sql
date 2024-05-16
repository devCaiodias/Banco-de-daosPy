/* Limit limita a qtd de valores */
/* offset desloca o cursos para exibir os resultados */
SELECT id, fist_name, email 
FROM users
WHERE id BETWEEN 100 and 150
ORDER BY id ASC
LIMIT 9,3;