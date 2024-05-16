SELECT u.id as uid, p.id as pid, p.bio, u.fist_name
FROM users as u
LEFT JOIN profiles as p
ON u.id = p.user_id
;

/* DELETE FROM profiles WHERE id BETWEEN 521 AND 523; */