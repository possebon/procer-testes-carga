from locust import HttpUser, TaskSet, task, between, constant
import random
from faker import Faker
from sqlalchemy import create_engine, MetaData, Table, select, update
from sqlalchemy.orm import sessionmaker
from contextlib import contextmanager
from dotenv import load_dotenv
import os
import logging
from threading import Lock

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

# Lock for synchronizing database allocation
allocation_lock = Lock()

# Shared list for database allocation
allocated_databases = []

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
        "ID_Historico": random.randint(1, 1000),
        "ID_Filial": random.choice(valid_filial_ids),
        "ID_Silo": random.choice(valid_silo_ids),
        "Tempo_Data": fake.date(),
        "Tempo_Hora": fake.time(),
        "Temp_Externa": round(random.uniform(10, 35), 2),
        "Temp_Externa_Conectado": random.randint(0, 1),
        "UR_Externa": round(random.uniform(10, 100), 2),
        "UR_Externa_Conectado": random.randint(0, 1),
        "TI": round(random.uniform(10, 35), 2),
        "TI_Conectado": random.randint(0, 1),
        "DI": round(random.uniform(10, 35), 2),
        "DI_Conectado": random.randint(0, 1),
        "MaxS": round(random.uniform(10, 35), 2),
        "MaxS_Conectado": random.randint(0, 1),
        "MinS": round(random.uniform(10, 35), 2),
        "MinS_Conectado": random.randint(0, 1),
        "Aeracao01": fake.word(),
        "Aeracao02": fake.word(),
        "Termometria": fake.text(),
        "Nivel_TM": random.randint(0, 100),
        "Contador_Tempo_Falta_Energia": random.randint(0, 1000),
        "Alimentacao_Bateria": random.randint(0, 1),
        "Quant_Sacos_Produto": random.randint(0, 10000),
        "ID_Produto": random.randint(1, 100),
        "Nivel_Termometria_Silo": fake.word(),
        "Nivel_Termometria_Silo_Percentual": fake.word(),
        "Codigo_Nao_Acionamento_Aerador": random.randint(0, 4),
        "Motivo_Acionamento_Aerador": fake.text(),
        "Exaustor": fake.word(),
        "Exaustor_Status_Ultimo_Acionamento": random.randint(0, 2),
        "Temperatura_Chapa": round(random.uniform(10, 35), 2),
        "Temperatura_Chapa_Conectado": random.randint(0, 1),
        "Temp_Interna_Chapeu": round(random.uniform(10, 35), 2),
        "Temp_Interna_Chapeu_Conectado": random.randint(0, 1),
        "UR_Interna_Chapeu": round(random.uniform(10, 100), 2),
        "UR_Interna_Chapeu_Conectado": random.randint(0, 1),
        "CO2": round(random.uniform(0, 5000), 2),
        "CO2_Conectado": random.randint(0, 1),
        "Teor_Umidade_Grao": round(random.uniform(10, 35), 2),
        "Status_Rele_Garner_Array": fake.word(),
        "Ponto_Orvalho": fake.word(),
        "Programa": fake.text(),
        "Data_Hora_Criado_Registro": fake.date_time().strftime("%Y-%m-%d %H:%M:%S"),
        "ID_Aerador_Programa": random.randint(1, 100),
        "Frequencia_Sensor_Chuva": random.randint(0, 100),
        "Mep_Medicoes_Eletricas_Silo": fake.word(),
        "Chave_Man_Aut": random.randint(0, 2),
        "Pluviometro_Chovendo": random.randint(0, 1),
        "Pluviometro_Milimetros_Chuva": round(random.uniform(0, 100), 2),
        "Sensor_Molhamento_Volts": round(random.uniform(0, 5), 2),
        "Queimador_Status": random.randint(0, 15),
        "Aeracao03": fake.word(),
        "Aeracao04": fake.word(),
        "Temp_Aux_2": round(random.uniform(10, 35), 2),
        "Temp_Aux_2_Conectado": random.randint(0, 1),
        "UR_Aux_2": round(random.uniform(10, 100), 2),
        "UR_Aux_2_Conectado": random.randint(0, 1),
        "Queimador_Habilitacao": random.randint(0, 1),
        "Chave_Man_Aut_M0304": random.randint(0, 2),
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
        "Aguardando_MEP": random.randint(0, 1),
        "Armazem_Linha_Pendulo_Geral": fake.word(),
        "Armazem_Arco_Pendulo_Geral": fake.word(),
        "Aeracao_Status": fake.word(),
        "Aeracao_Status_Chaves_Painel": fake.word(),
        "Movto_Graos": random.randint(-1, 3),
        "Movto_Graos_Ultima_Comunicacao": fake.date_time().strftime("%Y-%m-%d %H:%M:%S"),
        "Pluviometro_Tempo_Sem_Pulso_Min": random.randint(-1, 255),
        "Estacao_3_Pluviometro_Tempo_Sem_Pulso_Min": random.randint(-1, 255),
        "MedicoesPenduloUR": fake.text(),
        "Sincronizado_CeresWeb": random.randint(0, 1),
        "PressaoFluxoAr": random.randint(0, 1023),
        "Sensor_Nivel_Metros_Graos_Hist": round(random.uniform(0, 10), 2),
        "Sensor_Nivel_Metros_Graos_Hist_2": round(random.uniform(0, 10), 2),
        "Sensor_Nivel_Data_Medicao_Hist": fake.date_time().strftime("%Y-%m-%d %H:%M:%S"),
        "Estacao_1_Anemometro_Velocidade_Vento_Hist": round(random.uniform(0, 10), 2),
        "Estacao_1_Anemometro_Direcao_Vento_Hist": random.randint(0, 359),
        "Estacao_2_Anemometro_Velocidade_Vento_Hist": round(random.uniform(0, 10), 2),
        "Estacao_2_Anemometro_Direcao_Vento_Hist": random.randint(0, 359),
        "Estacao_3_Anemometro_Velocidade_Vento_Hist": round(random.uniform(0, 10), 2),
        "Estacao_3_Anemometro_Direcao_Vento_Hist": random.randint(0, 359),
    }

def insert_data(engine, db_name):
    valid_silo_ids = get_valid_ids(engine, 'ceres_silos', 'ID_Silo')
    valid_filial_ids = get_valid_ids(engine, 'ceres_filiais', 'ID_Filial')
    metadata = MetaData()
    ceres_historico = Table('ceres_historico', metadata, autoload_with=engine)
    
    data = generate_random_data(valid_silo_ids, valid_filial_ids)
    ins = ceres_historico.insert().values(data)
    
    try:
        with get_session(engine) as session:
            session.execute(ins)
            session.commit()
        logging.info(f'Insert successful into {db_name}')
    except Exception as e:
        logging.error(f'Insert failed into {db_name}: {e}')

class DatabaseTaskSet(TaskSet):
    def on_start(self):
        global allocated_databases

        with allocation_lock:
            if not allocated_databases:
                num_databases = self.user.environment.runner.user_count
                allocated_databases = get_available_databases(num_databases)
                if not allocated_databases:
                    logging.error('No available databases to use')
                    return
            
            self.db_name = allocated_databases.pop()
            self.engine = create_engine(f"mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}/{self.db_name}")

    @task(10)
    def perform_insertion(self):
        if self.engine:
            insert_data(self.engine, self.db_name)

class DatabaseUser(HttpUser):
    tasks = [DatabaseTaskSet]
    wait_time = constant(120)
    # wait_time = constant(7200)

if __name__ == "__main__":
    import os
    os.system("locust -f ceres_historico.py --host http://localhost")