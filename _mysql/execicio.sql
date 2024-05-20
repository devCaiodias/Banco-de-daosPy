-- Active: 1715620302392@@127.0.0.1@3306@banco_de_dados
-- 1) Insira 5 usuários

INSERT INTO users (fist_name, last_name, email, password_hash, salary) VALUES
('leandro', 'robo', 'robo@email.com', ROUND(RAND() * 10000), ROUND(RAND() * 1000000)),
('borabill', 'bora', 'robo1@email.com', ROUND(RAND() * 10000), ROUND(RAND() * 1000000)),
('lernos', 'late', 'robo2@email.com', ROUND(RAND() * 10000), ROUND(RAND() * 1000000)),
('porq', 'uro', 'robo3@email.com', ROUND(RAND() * 10000), ROUND(RAND() * 1000000)),
('jutulo', 'braga', 'robo4@email.com', ROUND(RAND() * 10000), ROUND(RAND() * 1000000));

-- 2) Insira 5 perfís para os usuários inseridos

INSERT INTO profiles (bio, description, user_id) VALUES
('Bio de ', 'Uma decription ', (SELECT id FROM users WHERE id = 238)),
('Bio de ', 'Uma decription ', (SELECT id FROM users WHERE id = 239)),
('Bio de ', 'Uma decription ', (SELECT id FROM users WHERE id = 240)),
('Bio de ', 'Uma decription ', (SELECT id FROM users WHERE id = 241)),
('Bio de ', 'Uma decription ', (SELECT id FROM users WHERE id = 242));

-- 3) Insira permissões (roles) para os usuários inseridos

INSERT INTO users_roles (user_id, roles_id)
VALUES (239, 6), (240, 4), (241, 5), (242, 6);

-- 4) Selecione os últimos 5 usuários por ordem decrescente

SELECT id, fist_name, last_name FROM users
WHERE id BETWEEN 238 AND 242
ORDER BY fist_name DESC;

-- 5) Atualize o último usuário inserido

UPDATE users SET fist_name = 'jotaro', last_name = 'jo star'
WHERE id = 242;

-- 6) Remova uma permissão de algum usuário

DELETE FROM users_roles WHERE user_id = 240; 

-- 7) Remova um usuário que tem a permissão "PUT"

DELETE FROM users_roles WHERE user_id = 207; 

-- 8) Selecione usuários com perfís e permissões (obrigatório)

SELECT u.id, u.fist_name, u.last_name, us.roles_id FROM users as u, users_roles as us
WHERE id BETWEEN 238 AND 242
LIMIT 5;

-- 9) Selecione usuários com perfís e permissões (opcional)

SELECT u.id as uid, u.fist_name, r.name, p.bio
FROM users AS u
LEFT JOIN users_roles as ur ON u.id = ur.user_id
LEFT JOIN roles as r ON ur.roles_id = r.id
LEFT JOIN profiles as p ON p.user_id = u.id;


-- 10) Selecione usuários com perfís e permissões ordenando por salário

SELECT u.id as uid, u.fist_name, r.name, p.bio, u.salary
FROM users AS u
LEFT JOIN users_roles as ur ON u.id = ur.user_id
LEFT JOIN roles as r ON ur.roles_id = r.id
LEFT JOIN profiles as p ON p.user_id = u.id
ORDER BY u.salary  DESC;

