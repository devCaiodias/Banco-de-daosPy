SELECT 
fist_name,
MAX(u.salary) AS max_salary,
MIN(u.salary) AS min_salary,
AVG(u.salary) AS avg_salary,
SUM(u.salary) AS sum_salary,
COUNT(u.id) as total
FROM users as u
LEFT JOIN profiles as p
ON p.user_id = u.id
GROUP BY u.fist_name
ORDER BY total DESC;