-- Active: 1715620302392@@127.0.0.1@3306@banco_de_dados
/* Mostra as tabelas da base de dados */
SHOW TABLES;
/* Descreve as colunas da tabelas */
DESCRIBE users;
/* Inserir registros na base de dados */
INSERT INTO users (fist_name, last_name, email, password_hash) VALUES ("Debora", "Naibo", "debora@email.com", "3654"), ("Vinicius", "mendez", "vinin@gmail.com", "28924"), ("bob", "barros", "bob@gmail.com", "15547");