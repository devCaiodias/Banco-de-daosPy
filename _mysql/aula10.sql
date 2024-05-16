/* insert select */
/* insere valores em uma tabela usando outra */
INSERT INTO profiles (bio, description, user_id)
SELECT CONCAT('Bio de ', fist_name), CONCAT('Description de ', fist_name), id FROM users;


DELETE FROM profiles;