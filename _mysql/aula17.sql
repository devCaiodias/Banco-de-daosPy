/* Configura um salario aleatorio para users */
UPDATE users set salary = ROUND(RAND() * 10000, 2);

SELECT salary FROM users 
WHERE salary BETWEEN 1000 AND 2000
ORDER BY salary ASC;