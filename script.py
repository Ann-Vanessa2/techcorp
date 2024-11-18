import psycopg2 as pg
from dotenv import load_dotenv
import os

load_dotenv('.env')

connectionString = os.getenv('POSTGRES_DB')
connection = pg.connect(connectionString)
cursor = connection.cursor()

# cursor.execute(
# '''
# CREATE TABLE IF NOT EXISTS customers (
#     customer_id SERIAL PRIMARY KEY,
#     customer_name VARCHAR(50) NOT NULL,
#     customer_email VARCHAR(50) NOT NULL,
#     customer_address VARCHAR(50) NOT NULL
# );
# '''
# )

# cursor.execute(
# '''
# CREATE TABLE IF NOT EXISTS suppliers (
#     supplier_id SERIAL PRIMARY KEY,
#     supplier_name VARCHAR(50) NOT NULL
# );
# '''
# )

# cursor.execute(
# '''
# CREATE TABLE IF NOT EXISTS products (
#     product_id SERIAL PRIMARY KEY,
#     product_name VARCHAR(50) NOT NULL,
#     category VARCHAR(50) NOT NULL,
#     price NUMERIC(12,2) NOT NULL,
#     supplier_id INTEGER NOT NULL REFERENCES suppliers
# );
# '''
# )

# cursor.execute(
# '''
# CREATE TABLE IF NOT EXISTS orders (
#     order_id SERIAL PRIMARY KEY,
#     order_date DATE NOT NULL,
#     quantity INTEGER NOT NULL,
#     total NUMERIC(12,2) NOT NULL,
#     product_id INTEGER NOT NULL REFERENCES products,
#     customer_id INTEGER NOT NULL REFERENCES customers
# );
# '''
# )

# cursor.execute(
# '''
# CREATE TABLE IF NOT EXISTS order_details (
#     order_detail_id SERIAL PRIMARY KEY,
#     order_id INTEGER NOT NULL REFERENCES orders,
#     product_id INTEGER NOT NULL REFERENCES products
# );
# '''
# )

cursor.execute(
'''
ALTER TABLE products 
ADD stock_quantity INTEGER NOT NULL;
'''
)



# cursor.execute(
# '''
# INSERT INTO customers
#     (customer_name, customer_email, customer_address)
#     VALUES (%s, %s, %s)
# ;
# '''
# )




connection.commit()
cursor.close()
connection.close()