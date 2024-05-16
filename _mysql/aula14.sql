SELECT u.id as uid, p.id as pid, p.bio, u.fist_name
FROM users as u, profiles as p
WHERE u.id = p.user_id;

SELECT u.id as uid, p.id as pid, p.bio, u.fist_name
FROM users as u
INNER JOIN profiles as p
ON u.id = p.user_id
WHERE u.fist_name LIKE '%a'
ORDER BY u.fist_name ASC
LIMIT 5;

/* DELETE FROM profiles WHERE id BETWEEN 521 AND 523; */