import os
import random
import logging
import uuid
from datetime import datetime
from faker import Faker
from sqlalchemy import create_engine, MetaData, Table, select, update
from sqlalchemy.orm import sessionmaker
from contextlib import contextmanager
from locust import HttpUser, task, between
from dotenv import load_dotenv

# Gevent monkey patch to ensure non-blocking I/O
from gevent import monkey
monkey.patch_all()

# Load environment variables from .env file
load_dotenv()

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

fake = Faker()
DB_HOST = os.getenv('DB_HOST')
DB_USERNAME = os.getenv('DB_USERNAME')
DB_PASSWORD = os.getenv('DB_PASSWORD')
CONTAINER_ID = str(uuid.uuid4())

# Define the database URL template
DATABASE_URL_TEMPLATE = 'mysql+pymysql://{username}:{password}@{host}/{dbname}'

# Connection URL for the report_db
REPORT_DB_URL = DATABASE_URL_TEMPLATE.format(username=DB_USERNAME, password=DB_PASSWORD, host=DB_HOST, dbname='report_db')

def get_available_database():
    engine = create_engine(REPORT_DB_URL, pool_pre_ping=True, pool_size=1, max_overflow=0)
    metadata = MetaData()
    database_list = Table('database_list', metadata, autoload_with=engine)
    
    with engine.connect() as connection:
        query = select(database_list.c.database_name).where(database_list.c.status == 'available').order_by(database_list.c.database_name).limit(1)
        result = connection.execute(query).fetchone()
        if result:
            db_name = result[0]
            update_query = update(database_list).where(database_list.c.database_name == db_name).values(status='executing')
            connection.execute(update_query)
            return db_name
        else:
            logging.error('No available database found')
            return None

def get_valid_ids(engine, table, id_field):
    metadata = MetaData()
    table = Table(table, metadata, autoload_with=engine)
    session = sessionmaker(bind=engine)()
    return [row[0] for row in session.query(getattr(table.c, id_field)).all()]

def generate_random_data(valid_silo_ids, valid_filial_ids):
    return {
        "ID_Silo": random.choice(valid_silo_ids),
        "ID_Filial": random.choice(valid_filial_ids),
        "Status_Comunicacao": fake.word(),
        "Tempo_Data": fake.date(),
        "Tempo_Hora": fake.time(),
        "DataHoraEquipto": fake.date_time().strftime("%Y-%m-%d %H:%M:%S"),
        "Temp_Externa": round(random.uniform(10, 35), 2),
        "Temp_Externa_Conectado": random.randint(0, 1),
        "UR_Externa": round(random.uniform(10, 100), 2),
        "UR_Externa_Conectado": random.randint(0, 1),
        "Pluviometro_Chovendo": random.randint(0, 1),
        "Pluviometro_Milimetros_Chuva": round(random.uniform(0, 100), 2),
        "Sensor_Molhamento_Volts": round(random.uniform(0, 5), 2),
        "Temp_Estacao_2": round(random.uniform(10, 35), 2),
        "Temp_Estacao_2_Conectado": random.randint(0, 1),
        "UR_Estacao_2": round(random.uniform(10, 100), 2),
        "UR_Estacao_2_Conectado": random.randint(0, 1),
        "Temp_Estacao_3": round(random.uniform(10, 35), 2),
        "Temp_Estacao_3_Conectado": random.randint(0, 1),
        "UR_Estacao_3": round(random.uniform(10, 100), 2),
        "UR_Estacao_3_Conectado": random.randint(0, 1),
        "Estacao_3_Pluviometro_Chovendo": random.randint(0, 1),
        "Estacao_3_Pluviometro_Milimetros_Chuva": round(random.uniform(0, 100), 2),
        "Estacao_1_Descricao": fake.word(),
        "Estacao_2_Descricao": fake.word(),
        "Estacao_3_Descricao": fake.word(),
        "Estacao_3_Remota": random.randint(0, 1),
        "Estacao_3_Remota_Data": fake.date(),
        "Estacao_3_Remota_Hora": fake.time(),
        "Pluviometro_Tempo_Sem_Pulso_Min": random.randint(-1, 255),
        "Estacao_3_Pluviometro_Tempo_Sem_Pulso_Min": random.randint(-1, 255),
        "Estacao_1_Anemometro_Velocidade_Vento": round(random.uniform(0, 10), 2),
        "Estacao_1_Anemometro_Direcao_Vento": random.randint(0, 359),
        "Estacao_2_Anemometro_Velocidade_Vento": round(random.uniform(0, 10), 2),
        "Estacao_2_Anemometro_Direcao_Vento": random.randint(0, 359),
        "Estacao_3_Anemometro_Velocidade_Vento": round(random.uniform(0, 10), 2),
        "Estacao_3_Anemometro_Direcao_Vento": random.randint(0, 359),
    }

@contextmanager
def get_session(engine):
    session = sessionmaker(bind=engine)()
    try:
        yield session
    except Exception as e:
        session.rollback()
        raise
    finally:
        session.close()

def insert_data(engine, db_name):
    valid_silo_ids = get_valid_ids(engine, 'ceres_silos', 'ID_Silo')
    valid_filial_ids = get_valid_ids(engine, 'ceres_filiais', 'ID_Filial')

    metadata = MetaData()
    ceres_medicoes_info = Table('ceres_medicoes_info', metadata, autoload_with=engine)

    data = generate_random_data(valid_silo_ids, valid_filial_ids)
    ins = ceres_medicoes_info.insert().values(data)
    try:
        with get_session(engine) as session:
            session.execute(ins)
            session.commit()
        logging.info(f'Insert successful into {db_name}')
    except Exception as e:
        logging.error(f'Insert failed into {db_name}: {e}')

class DatabaseUser(HttpUser):
    wait_time = between(120, 120)  # Setting wait_time to 120 seconds
    host = "http://example.com"  # Dummy host to satisfy Locust's requirement

    @task
    def perform_insertion(self):
        db_name = get_available_database()
        if not db_name:
            logging.error('No available database found, stopping user')
            self.stop()
        else:
            db_engine = create_engine(DATABASE_URL_TEMPLATE.format(username=DB_USERNAME, password=DB_PASSWORD, host=DB_HOST, dbname=db_name), pool_pre_ping=True, pool_size=1, max_overflow=0)
            insert_data(db_engine, db_name)

    def on_stop(self):
        db_name = get_available_database()
        if db_name:
            logging.info(f'Cleaning up: setting {db_name} back to available')
            engine = create_engine(REPORT_DB_URL, pool_pre_ping=True, pool_size=1, max_overflow=0)
            metadata = MetaData()
            database_list = Table('database_list', metadata, autoload_with=engine)
            with engine.connect() as connection:
                update_query = update(database_list).where(database_list.c.database_name == db_name).values(status='available')
                connection.execute(update_query)

if __name__ == '__main__':
    import os
    os.system("locust -f locustfile.py --users 2000 --spawn-rate 100")
