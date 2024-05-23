import os
import logging
import redis
from sqlalchemy import create_engine, text

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

DB_HOST = os.getenv('DB_HOST')
DB_USERNAME = os.getenv('DB_USERNAME')
DB_PASSWORD = os.getenv('DB_PASSWORD')
REDIS_HOST = os.getenv('REDIS_HOST')

# Define the database URL template
DATABASE_URL_TEMPLATE = 'mysql+pymysql://{username}:{password}@{host}'

# Format the template with actual values
DATABASE_URL = DATABASE_URL_TEMPLATE.format(username=DB_USERNAME, password=DB_PASSWORD, host=DB_HOST)

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

def store_databases_in_redis(databases):
    r = redis.Redis(host=REDIS_HOST, port=6379, db=0)
    for db in databases:
        r.set(f'database:{db}', 'available')
    logging.info('Stored databases in Redis with status available')

if __name__ == '__main__':
    databases = fetch_databases()
    store_databases_in_redis(databases)
