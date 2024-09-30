





import psycopg2

while True:
    info = int(input(f'1.Создать таблицу'
                         f'2.Добавить пользователя\n'
                         f'3.Изменить значения пользователя\n'
                         f'4.Изменить номер\n'
                         f'5.Удалить пользователя\n'
                         f'6.Вывести всю информацию'))
    if info == 1:
        a=input('Имя пользователя')
        b=input('email пользователя')
        f=input('телефон пользователя')
        def funcone():
            conn = psycopg2.connect(dbname='testdb1', user='postgres',password='user',host='127.0.0.1',port='5432')

            cursor=conn.cursor()

            cursor.execute("CREATE TABLE Pfonetel"
                           "(id SERIAL PRIMARY KEY,"
                           "name VARCHAR(50),"
                           "email VARCHAR(20),"
                           "numphone VARCHAR(30) )")
            conn.commit()
            conn.close()
            cursor.close()
        funcone()


    elif info ==2:
        a=input('Имя пользователя')
        b=input('email пользователя')
        f=input('телефон пользователя')
        def funcone(a,b,f):
            cortegh=(a,b,f)
            conn = psycopg2.connect(dbname='testdb1', user='postgres',password='user',host='127.0.0.1',port='5432')

            cursor=conn.cursor()

            cursor.execute("INSERT INTO Pfonetel(name,email,numphone) VALUES (%s,%s,%s)",cortegh)


            conn.commit()
            conn.close()
            cursor.close()
        funcone(a,b,f)
    elif info ==3:
        id1=int(input('id пользователя'))
        a=input('Имя пользователя')
        b=input('email пользователя')
        f=input('телефон пользователя')
        def funcone(id,a,b,f):
            cortegh=(a,b,f,id)
            conn = psycopg2.connect(dbname='testdb1', user='postgres',password='user',host='127.0.0.1',port='5432')

            cursor=conn.cursor()

            cursor.execute("UPDATE Pfonetel SET name=%s,email = %s,numphone=%s WHERE id=%s",cortegh)

            conn.commit()
            conn.close()
            cursor.close()
        funcone(id1,a,b,f)
    elif info ==4:
        id1=int(input('id пользователя'))
        f=input('телефон пользователя')
        def funcone(id,f):
            cortegh=(id,f)
            conn = psycopg2.connect(dbname='testdb1', user='postgres',password='user',host='127.0.0.1',port='5432')

            cursor=conn.cursor()

            cursor.execute("UPDATE Pfonetel SET numphone=%s WHERE id=%s",cortegh)

            conn.commit()
            conn.close()
            cursor.close()
        funcone(id1,f)
    elif info ==5:
        id1=int(input('id пользователя'))
        def funcone(id,):
            cortegh=(id,)
            conn = psycopg2.connect(dbname='testdb1', user='postgres',password='user',host='127.0.0.1',port='5432')

            cursor=conn.cursor()

            cursor.execute("DELETE FROM Pfonetel WHERE id=%s",cortegh)

            conn.commit()
            conn.close()
            cursor.close()
        funcone(id1)
    elif info ==6:
        id1=int(input('id пользователя'))
        a=input('Имя пользователя')
        b=input('email пользователя')
        f=input('телефон пользователя')
        def funcone(id,a,b,f):
            cortegh=(id,a,b,f)
            conn = psycopg2.connect(dbname='testdb1', user='postgres',password='user',host='127.0.0.1',port='5432')

            cursor=conn.cursor()

            cursor.execute("SELECT * FROM Pfonetel WHERE id=%s OR name=%s OR email=%s OR numphone=%s",cortegh)
            print(cursor.fetchall())

            conn.commit()
            conn.close()
            cursor.close()
        funcone(id1,a,b,f)