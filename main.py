# PyMySQL - um cliente MySQL feito em Python Puro
# Doc: https://pymysql.readthedocs.io/en/latest/
# Pypy: https://pypi.org/project/pymysql/
# GitHub: https://github.com/PyMySQL/PyMySQL
import os

import pymysql
import dotenv 

TABLE_NAME = 'users'

dotenv.load_dotenv()

connection = pymysql.connect(
    host=os.environ['MYSQL_HOST'],
    user=os.environ['MYSQL_USER'],
    password=os.environ['MYSQL_PASSWORD'],
    database=os.environ['MYSQL_DATABASE'],
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

    with connection.cursor() as cursor:
        resultado = cursor.execute(
            f'INSERT INTO {TABLE_NAME} '
            '(name, idade) VALUES ("Caio Dias", 18) '
        )
        resultado = cursor.execute(
            f'INSERT INTO {TABLE_NAME} '
            '(name, idade) VALUES ("Caio Dias", 18) '
        )
        resultado = cursor.execute(
            f'INSERT INTO {TABLE_NAME} '
            '(name, idade) VALUES ("Caio Dias", 18) '
        )
        print(resultado)
    connection.commit()