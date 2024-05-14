# PyMySQL - um cliente MySQL feito em Python Puro
# Doc: https://pymysql.readthedocs.io/en/latest/
# Pypy: https://pypi.org/project/pymysql/
# GitHub: https://github.com/PyMySQL/PyMySQL
import os
from typing import cast

import pymysql
import dotenv 
import pymysql.cursors

TABLE_NAME = 'users'
CURRENT_CURSOR = pymysql.cursors.DictCursor

dotenv.load_dotenv()

connection = pymysql.connect(
    host=os.environ['MYSQL_HOST'],
    user=os.environ['MYSQL_USER'],
    password=os.environ['MYSQL_PASSWORD'],
    database=os.environ['MYSQL_DATABASE'],
    cursorclass=CURRENT_CURSOR,

)

with connection:
    with connection.cursor() as cursor:
        #SQL
        cursor.execute(
            f'CREATE TABLE IF NOT EXISTS {TABLE_NAME} ( '
            'id INT NOT NULL AUTO_INCREMENT, '
            'name VARCHAR(50) NOT NULL, '
            'idade INT NOT NULL, '
            'PRIMARY KEY (id)'
            ') '
        )
        # CUIDADE ISSO LIMPA A TABELA
        cursor.execute(f'TRUNCATE TABLE {TABLE_NAME} ')
    connection.commit()

    # COMEÇO A MANIPULAR DADOS A PARTIR DAQUI

    # Inserindo um valor usando placeholder e um iterável
    with connection.cursor() as cursor:
        sql = (
            f'INSERT INTO {TABLE_NAME} '
            '(name, idade) '
            'VALUES ' 
            '(%s, %s) '

        )
        data = ('Caio', 18)
        resultado = cursor.execute(sql, data)
        # print(sql, data)
        # print(resultado)
    connection.commit()

    # Inserindo um valor usando placeholder e um dicionário
    with connection.cursor() as cursor:
        sql = (
            f'INSERT INTO {TABLE_NAME} '
            '(name, idade) '
            'VALUES ' 
            '(%(name)s, %(age)s) '
        )
        data2 = {
            "name": "vini",
            "age": 19
        }
        resultado = cursor.execute(sql, data2)
        # print(sql, data2)
        # print(resultado)
    connection.commit()

    # Inserindo vários valores usando placeholder e um tupla de dicionários
    with connection.cursor() as cursor:
        sql = (
            f'INSERT INTO {TABLE_NAME} '
            '(name, idade) '
            'VALUES ' 
            '(%(name)s, %(age)s) '
        )
        data3 = (
            {"name": "Debora", "age": 20,},
            {"name": "João", "age": 22,},
            {"name": "Alan", "age": 23,},
        )
        # cursor.executemany para enviar mais de um dados para sua tabela
        resultado = cursor.executemany(sql, data3)
        # print(sql, data3)
        # print(resultado)
    connection.commit()

    # Inserindo vários valores usando placeholder e um tupla de tuplas
    with connection.cursor() as cursor:
        sql = (
            f'INSERT INTO {TABLE_NAME} '
            '(name, idade) '
            'VALUES ' 
            '(%s, %s) '
        )
        data4 = (
            ("baibo", 20,),
            ("sixk", 22,),
            ("Caio", 18)
        )
        # cursor.executemany para enviar mais de um dados para sua tabela
        resultado = cursor.executemany(sql, data4)
        # print(sql, data4)
        # print(resultado)
    connection.commit()

    # Lendo os valores com SELECT

    with connection.cursor() as cursor:
        # menor_id = int(input('Dijite menor id: '))
        # maior_id = int(input('Dijite menor id: '))
        menor_id = 2
        maior_id = 4

        sql = (
            f'SELECT * FROM {TABLE_NAME} '
            'WHERE id BETWEEN %s AND %s '
        )
        cursor.execute(sql, (menor_id, maior_id))
        # print(cursor.mogrify(sql, (menor_id, maior_id)))
        data5 = cursor.fetchall()

        # for row in data5:
        #     print(row)

    # Apagando com DELETE, WHERE e placeholders no PyMySQL
    with connection.cursor() as cursor:
        sql = (
            f'DELETE FROM {TABLE_NAME} '
            'WHERE id = %s'
        )
        cursor.execute(sql, (4))
        connection.commit()

        cursor.execute(f'SELECT * FROM {TABLE_NAME} ')

        # for row in cursor.fetchall():
        #     print(row)

    # Editando com UPDATE, WHERE e placeholders no PyMySQL
    with connection.cursor() as cursor:
        cursor = cast(CURRENT_CURSOR, cursor)
        sql = (
            f'UPDATE {TABLE_NAME} '
            'SET name=%s, idade=%s '
            'WHERE id = %s'
        )
        cursor.execute(sql, ('davi', 58, 7))
        resultFromSelect = cursor.execute(f'SELECT * FROM {TABLE_NAME} ')

        data7 = cursor.fetchall()

        for row in data7:
            print(row)

        cursor.execute(
            f'SELECT id from {TABLE_NAME} ORDER BY id DESC LIMIT 1 '
        )

        lastIdFromSelect = cursor.fetchone()

        print('resultFromSelect', resultFromSelect)
        print('len(data7)', len(data7))
        print('rowcount', cursor.rowcount)

        print('lastrowid na mão', lastIdFromSelect)


    connection.commit()