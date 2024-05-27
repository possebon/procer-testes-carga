from locust import HttpUser, TaskSet, task, between
import random
from faker import Faker
import pymysql
from sqlalchemy import create_engine, MetaData, Table
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

# Initialize Faker for data generation
fake = Faker()

# Database connection details from environment variables
DB_HOST = os.getenv('DB_HOST')
DB_USER = os.getenv('DB_USERNAME')
DB_PASSWORD = os.getenv('DB_PASSWORD')
DB_PREFIX = 'ceres_'

def get_valid_ids(engine, table_name, id_column):
    query = f"SELECT {id_column} FROM {table_name}"
    with engine.connect() as conn:
        result = conn.execute(query)
        return [row[id_column] for row in result]

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

    with engine.connect() as conn:
        conn.execute(ins)

class DatabaseTaskSet(TaskSet):
    def on_start(self):
        self.engine_dict = {}
        num_databases = len(self.user.environment.runner.user_classes[DatabaseUser].users)
        for i in range(1, num_databases + 1):
            db_name = f"{DB_PREFIX}{i}"
            engine = create_engine(f"mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}/{db_name}")
            self.engine_dict[db_name] = engine

    def on_stop(self):
        for engine in self.engine_dict.values():
            engine.dispose()

    @task
    def insert_ceres_medicoes_info(self):
        for db_name, engine in self.engine_dict.items():
            insert_data(engine, db_name)

class DatabaseUser(HttpUser):
    tasks = [DatabaseTaskSet]
    wait_time = between(1, 2)

if __name__ == "__main__":
    import os
    os.system("locust -f path_to_this_script.py")
