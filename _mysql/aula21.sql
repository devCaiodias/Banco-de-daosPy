SELECT u.id as uid, u.fist_name as ufist, p.bio, r.name
FROM users as u
LEFT JOIN profiles as p ON u.id = p.user_id
INNER JOIN users_roles as ur ON u.id = ur.user_id
INNER JOIN roles as r ON ur.roles_id = r.id
WHERE u.id = 111
ORDER BY uid ASC
LIMIT 1;