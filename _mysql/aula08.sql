/* Order ordena valores: */
/* order by id asc (id crecente) */
/* order by id desc (id decrecente) */
/* order by id asc, fist_name desc (prioriza o id) */

SELECT id, fist_name, email 
FROM users
WHERE id BETWEEN 100 and 150
ORDER BY fist_name DESC;