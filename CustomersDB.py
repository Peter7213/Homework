
import psycopg2
conn = psycopg2.connect(database='CustomersDB', user='postgres', password='password')
with (conn.cursor() as cur):
    def make_tables():
        cur.execute('''CREATE TABLE IF NOT EXISTS customers(
        id SERIAL PRIMARY KEY,
        surname VARCHAR(60) NOT NULL,
        name VARCHAR(60) NOT NULL,
        email VARCHAR(60) UNIQUE NOT NULL);''')

        cur.execute('''CREATE TABLE IF NOT EXISTS phones(
        phone_number VARCHAR(20) UNIQUE NOT NULL,
        customer_id INTEGER REFERENCES customers(id));''')
        conn.commit()
        print('Tables created')
        return

    def add_customer(surname, name, email):
        cur.execute('''INSERT INTO customers(surname, name, email)
        VALUES(%s, %s, %s);''', (surname, name, email.lower()))
        conn.commit()

    def add_phone(customer_id, phone_number):
        cur.execute('''INSERT INTO phones(customer_id, phone_number)
        VALUES(%s, %s);''', (customer_id, phone_number))
        conn.commit()

    def update_pers_data():
        cus_id = input('Input customer id ' )
        cur.execute('''SELECT id FROM customers''')                         #Возможно уязвимость
        all_ids = cur.fetchall()
        if int(cus_id) not in all_ids[0]:
            print('Id not found')
            return

        x = input('What would you like to change?\n'
                'Input 1 to change surname.\n'
                'Input 2 to change first name.\n'
                'Input 3 to change e-mail)\n')
        if x == '1':
            y = input('Input new surname: ')
            cur.execute('''UPDATE customers SET surname=%s WHERE id=%s'''
                        , (y, cus_id))
            conn.commit()
            print("Customer's surname updated successfully")
        if x == '2':
            y = input('Input new first name: ')
            cur.execute('''UPDATE customers SET name=%s WHERE id=%s'''
                        , (y, cus_id))
            conn.commit()
            print("Customer's name updated successfully")
        if x == '3':
            y = input('Input new e-mail: ')
            cur.execute('''UPDATE customers SET email=%s WHERE id=%s'''
                        , (y, cus_id))
            conn.commit()
            print("Customer's e-mail updated successfully")
        return

    def delete_phone(customer_id, phone_number):
        cur.execute('''DELETE FROM phones
        WHERE customer_id=%s AND phone_number=%s''', (customer_id, str(phone_number)))
        conn.commit()

    def delete_customer(customer_id):
        cur.execute('''SELECT customer_id FROM phones''')               #Возможно уязвимость
        cus_id_phones = cur.fetchall()
        if customer_id in cus_id_phones:
            cur.execute('''DELETE FROM phones WHERE customer_id=%s''', (str(customer_id)))
            conn.commit()

        cur.execute('''DELETE FROM customers WHERE id=%s''', (str(customer_id)))
        conn.commit()

    def searching_by_personal_data():

        def searching_c(search_data):
            table_request = (f'SELECT id, surname, name, email FROM customers WHERE {column_name}'
                             f' ILIKE {search_data}')                                               #Не получается защитить методом %s при использовании f-строки
            cur.execute(table_request)
            found_data = cur.fetchall()
            if found_data == []:
                print('Customer not found')

            for x in range(len(found_data)):
                c_id = str(found_data[x][0])
                cur.execute('''SELECT phone_number FROM phones WHERE customer_id=%s''', (c_id))
                phones = cur.fetchall()

                print(f'Surname: {found_data[x][1]} Name: {found_data[x][2]} E-mail: {found_data[x][3]}')
                print("Customer's phones:")
                for number in phones:
                    print(number[0])


        input_data = input("Input customer's surname (press Enter to search by name): ")
        column_name = 'surname'

        if input_data == '':
            input_data = input("Input customer's name (press Enter to search by e-mail): ")
            column_name = 'name'

            if input_data == '':
                input_data= input("Input customer's email: ")
                column_name = 'email'

                if input_data == '':
                    print('Customer not found')
                    return
        if '%' in input_data:
            print('Unacceptable symbol')
            return
        search_data = "'" + input_data.strip() + "'"
        searching_c(search_data)

    def searching_by_phone():
        phone_number = input("Input customer's number: ")
        cur.execute('''SELECT customer_id FROM phones WHERE phone_number=%s''', (phone_number,))

        if cur.fetchone() == None:
            print('Number not found')
            return

        c_id = cur.fetchone()
        cur.execute('''SELECT surname, name, email FROM customers WHERE id=%s''', (c_id,))
        customer_data = cur.fetchall()
        cur.execute('''SELECT phone_number FROM Phones WHERE customer_id=%s''', (c_id,))
        customer_phones = cur.fetchall()

        print(f'Surname: {customer_data[0][0]} Name: {customer_data[0][1]} E-mail: {customer_data[0][2]}')
        print("Customer's phones:")
        for number in customer_phones:
            print(number[0])


    # make_tables()
    # add_customer('Stalin', 'Josef', 'vsevgulag@sibir.ru')
    # add_customer('Stalin', 'John', 'Notthatstalin@yahoo.us')
    # add_phone(1, 7920901186)
    # add_phone(1, 7920308952)
    # add_phone(1, 7920911111)
    # add_phone(2, 19836515793)
    # add_phone(2, 19234567891)
    # add_phone(2, 19432165897)


    # update_pers_data()
    # delete_phone(1, 7920911111)
    # delete_customer(2)
    # searching_by_personal_data()
    # searching_by_phone()



conn.close()