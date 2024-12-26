import pandas as pd 
from sqlalchemy import create_engine

DATABASE_URL = 'mysql+pymysql://root:240622hssqlIT300@localhost/dwh'
engine = create_engine(DATABASE_URL, echo=True)



def load_and_insert(csv_file, table_name):
    df = pd.read_csv(csv_file)
    
    df.to_sql(table_name, con=engine, if_exists='append', index=False) 


load_and_insert('product_dim.csv', 'product_dim')
load_and_insert('local_dim.csv', 'local_dim')      
load_and_insert('customer_dim.csv', 'customer_dim') 
load_and_insert('date_dim.csv', 'date_dim')         
load_and_insert('facts_table.csv', 'facts_table')