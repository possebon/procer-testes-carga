import os
import random
import logging
import time
import redis
from datetime import datetime
from faker import Faker
from sqlalchemy import create_engine, MetaData, Table
from sqlalchemy.orm import sessionmaker
from contextlib import contextmanager
import uuid

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

fake = Faker()
REDIS_HOST = os.getenv('REDIS_HOST')
DB_HOST = os.getenv('DB_HOST')
DB_USERNAME = os.getenv('DB_USERNAME')
DB_PASSWORD = os.getenv('DB_PASSWORD')

CONTAINER_ID = str(uuid.uuid4())

r = redis.Redis(host=REDIS_HOST, port=6379, db=0)

# Define the database URL template
DATABASE_URL_TEMPLATE = 'mysql+pymysql://{username}:{password}@{host}/{{}}'

# Format the template with actual values
database_url_tmp = DATABASE_URL_TEMPLATE.format(username=DB_USERNAME, password=DB_PASSWORD, host=DB_HOST)

def get_available_database():
    for key in r.scan_iter("database:*"):
        if r.get(key) == b'available':
            db_name = key.decode('utf-8').split(':')[1]
            r.set(key, 'executing')
            return db_name
    logging.error('No available database found in Redis')
    return None

def get_valid_ids(engine, table, id_field):
    metadata = MetaData(bind=engine)
    metadata.reflect(bind=engine)
    table = Table(table, metadata, autoload=True)
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

def log_execution(engine, db_name, status, execution_time):
    report_db_url = DATABASE_URL_TEMPLATE.format(username=DB_USERNAME, password=DB_PASSWORD, host=DB_HOST, db='report_db')
    engine = create_engine(report_db_url)
    metadata = MetaData(bind=engine)
    metadata.reflect(bind=engine)
    execution_logs = Table('execution_logs', metadata, autoload=True)
    with get_session(engine) as session:
        ins = execution_logs.insert().values(
            container_id=CONTAINER_ID,
            database_name=db_name,
            status=status,
            execution_time=execution_time
        )
        session.execute(ins)
        session.commit()

def insert_data():
    db_name = get_available_database()
    if not db_name:
        return

    database_url = database_url_tmp.format(db_name)
    
    engine = create_engine(database_url)
    valid_silo_ids = get_valid_ids(engine, 'ceres_silos', 'ID_Silo')
    valid_filial_ids = get_valid_ids(engine, 'ceres_filiais', 'ID_Filial')

    metadata = MetaData(bind=engine)
    metadata.reflect(bind=engine)
    ceres_medicoes_historico = Table('ceres_medicoes_historico', metadata, autoload=True)

    while True:
        start_time = time.time()
        data = generate_random_data(valid_silo_ids, valid_filial_ids)
        ins = ceres_medicoes_historico.insert().values(data)
        try:
            with get_session(engine) as session:
                session.execute(ins)
                session.commit()
            execution_time = time.time() - start_time
            log_execution(engine, db_name, 'success', execution_time)
            logging.info(f'Insert successful into {db_name}')
        except Exception as e:
            execution_time = time.time() - start_time
            log_execution(engine, db_name, 'failed', execution_time)
            logging.error(f'Insert failed into {db_name}: {e}')
        finally:
            r.set(f'database:{db_name}', 'available')
        time.sleep(7200)  # Sleep for 2 hours

if __name__ == '__main__':
    insert_data()
