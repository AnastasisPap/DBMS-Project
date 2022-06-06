import psycopg2 
from cred_config import *

conn_string = 'host={0} user={1} dbname={2} password={3} sslmode={4}'.format(host, user, dbname, password, sslmode)
conn = psycopg2.connect(conn_string)
print('Connection established')