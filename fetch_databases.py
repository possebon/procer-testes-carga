import os
import logging
import redis
from sqlalchemy import create_engine, text

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

DB_HOST = os.getenv('DB_HOST')
DB_USERNAME = os.getenv('DB_USERNAME')
DB_PASSWORD = os.getenv('DB_PASSWORD')
REDIS_HOST = os.getenv('FETCH_REDIS_HOST')

# Define the database URL template
DATABASE_URL_TEMPLATE = 'mysql+pymysql://{username}:{password}@{host}'

# Format the template with actual values
DATABASE_URL = DATABASE_URL_TEMPLATE.format(username=DB_USERNAME, password=DB_PASSWORD, host=D
def store_databases_in_redis(databases):
    r = redis.Redis(host=REDIS_HOST, port=6379, db=0)
    for db in databases:
        r.set(f'database:{db}', 'available')
    logging.info('Stored databases in Redis with status available')

if __name__ == '__main__':
    databases = fetch_databases()
    store_databases_in_redis(databases)
