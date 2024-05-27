from locust import HttpUser, TaskSet, task, between, constant
import random
from faker import Faker
from sqlalchemy import create_engine, MetaData, Table, select, update
from sqlalchemy.orm import sessionmaker
from contextlib import contextmanager
from dotenv import load_dotenv
import os
import logging

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Load environment variables from .env file
load_dotenv()

# Initialize Faker for data generation
fake = Faker()

# Database connection details from environment variables
DB_HOST = os.getenv('DB_HOST')
DB_USER = os.getenv('DB_USERNAME')
DB_PASSWORD = os.getenv('DB_PASSWORD')
DB_PREFIX = 'ceres_'

# Define the database URL template
DATABASE_URL_TEMPLATE = 'mysql+pymysql://{username}:{password}@{host}/{dbname}'

# Connection URL for the report_db
REPORT_DB_URL = DATABASE_URL_TEMPLATE.format(username=DB_USER, password=DB_PASSWORD, host=DB_HOST, dbname='report_db')

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

def get_available_databases(user_count):
    engine = create_engine(REPORT_DB_URL)
    metadata = MetaData()
    database_list = Table('database_list', metadata, autoload_with=engine)
    
    with engine.connect() as connection:
        query = select(database_list.c.database_name).where(database_list.c.status == 'available').order_by(database_list.c.database_name).limit(user_count)
        result = connection.execute(query).fetchall()
        if result:
            db_names = [row[0] for row in result]
            update_query = update(database_list).where(database_list.c.database_name.in_(db_names)).values(status='executing')
            connection.execute(update_query)
            return db_names
        else:
            logging.error('No available databases found')
            return None

def get_valid_ids(engine, table_name, id_field):
    metadata = MetaData()
    table = Table(table_name, metadata, autoload_with=engine)
    with engine.connect() as conn:
        result = conn.execute(select(table.c[id_field]))
        return [row[0] for row in result]

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

class DatabaseTaskSet(TaskSet):
    def on_start(self):
        self.db_name = None
        self.engine = None
        num_databases = self.user.environment.runner.user_count
        database_list = get_available_databases(num_databases)

        if database_list:
            self.db_name = database_list.pop()
            self.engine = create_engine(f"mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}/{self.db_name}")
        else:
            logging.error('No available databases to use')

    @task(10)
    def perform_insertion(self):
        if self.engine:
            insert_data(self.engine, self.db_name)

class DatabaseUser(HttpUser):
    tasks = [DatabaseTaskSet]
    wait_time = constant(120)

if __name__ == "__main__":
    import os
    os.system("locust -f ceres_medicoes_info.py")
