import os
import logging
from sqlalchemy import create_engine, text, MetaData, Table, Column, Integer, String
from sqlalchemy.orm import sessionmaker

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

DB_HOST = os.getenv('DB_HOST')
DB_USERNAME = os.getenv('DB_USERNAME')
DB_PASSWORD = os.getenv('DB_PASSWORD')
REPORT_DB_NAME = 'report_db'

# Define the database URL template
DATABASE_URL_TEMPLATE = 'mysql+pymysql://{username}:{password}@{host}/{dbname}'

# Format the template with actual values
DATABASE_URL = DATABASE_URL_TEMPLATE.format(username=DB_USERNAME, password=DB_PASSWORD, host=DB_HOST, dbname='')
REPORT_DB_URL = DATABASE_URL_TEMPLATE.format(username=DB_USERNAME, password=DB_PASSWORD, host=DB_HOST, dbname=REPORT_DB_NAME)

def fetch_databases():
    engine = create_engine(DATABASE_URL)
    query = text("""
    SELECT SCHEMA_NAME
    FROM INFORMATION_SCHEMA.SCHEMATA
    WHERE SCHEMA_NAME LIKE 'ceres_%'
    AND SCHEMA_NAME <> 'ceres_backoffice_old2'
    ORDER BY 1;
    """)
    with engine.connect() as connection:
        result = connection.execute(query)
        databases = [row[0] for row in result]
    logging.info(f'Fetched databases: {databases}')
    return databases

def store_databases_in_db(databases):
    engine = create_engine(REPORT_DB_URL)
    metadata = MetaData()
    database_list = Table('database_list', metadata,
                          Column('id', Integer, primary_key=True, autoincrement=True),
                          Column('database_name', String(255), nullable=False),
                          Column('status', String(50), nullable=False))
    
    # Create the table if it doesn't exist
    metadata.create_all(engine)
    
    with engine.connect() as connection:
        for db in databases:
            insert_stmt = database_list.insert().values(database_name=db, status='available')
            connection.execute(insert_stmt)
    logging.info('Stored databases in report_db.database_list with status available')

if __name__ == '__main__':
    databases = fetch_databases()
    store_databases_in_db(databases)
