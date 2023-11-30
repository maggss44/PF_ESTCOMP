import psycopg2
import os
import pandas as pd
from dotenv import load_dotenv
# Credentials
load_dotenv()
USER,PASSWORD=os.getenv('DB_USER'),os.getenv('DB_PASSWORD')
# SUPPORT
def write_results_into_db(user, password, data, table,
                          dbname='postgres', 
                          host='0.0.0.0', 
                          port='5432'):
    
    '''Write results back into ReportingDB'''
    # get connection
    connection = psycopg2.connect(dbname=dbname,
                                  host=host,
                                  port=port,
                                  user=user,
                                  password=password)
    
    # get cursor
    cursor = connection.cursor()
    
    # reshape data for query

    if len(data[0])==1:
        parsing='(%s)'

    else:
        parsing = str(tuple(['%s'] * len(data[0])))
        parsing = parsing.replace('\'', '')
    
    # reshape data for query
    args_str = b','.join(cursor.mogrify(parsing, x) for x in tuple(map(tuple,data)))
    
    # get query and write into database
    query = "INSERT INTO " + table + " VALUES "+args_str.decode("utf-8")
    
    # write into db
    cursor.execute(query)
    print('Successfully wrote into DB')

    cursor.close()
    connection.commit()
    connection.close()
    print(f'Closed connection to {host}')

def write_into_db(query, user,
                  password,
                  dbname='postgres', 
                  host='0.0.0.0', 
                  port='5432',
                  message='Successfully wrote into DB'):
    
    """Write into RpeortingDB e.g. to create table, drop table, or to write results into ReportingDB"""
    # get connection
    connection = psycopg2.connect(dbname=dbname, 
                                  host=host, 
                                  port=port,
                                  user=user, 
                                  password=password)
    
    # get cursor
    cursor = connection.cursor()
    
    # execute statement
    cursor.execute(query)
    connection.commit()
    print(message)
        
    # close connection and cursor
    cursor.close()
    connection.close()

# MAIN 
def main():
    command = """CREATE TABLE monitoreo (
        filename text,
        tool text,
        cutting_depth_ai float,
        tool_diameter_d float,
        diameter_ae float,
        feed_vel_f float,
        revol_N float,
        num_of_inserts_z int,
        feet_per_insert_fz float,
        cut_vel_vc float,
        Power float,
        Energy float,
        time float,
        distance float
    );"""
    write_into_db(query=command,user=USER,password=PASSWORD,message="Table created successfully")
    df = pd.read_csv("https://docs.google.com/spreadsheets/d/11QyMYrydf7UlFXuNT7DjI_s1vF7Jd2erppHEFdwgVuY/export?format=csv")
    write_results_into_db(USER,PASSWORD,df.values.tolist(),"monitoreo")

if __name__ == "__main__":
    main()