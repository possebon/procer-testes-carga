import uuid
import os
from dotenv import load_dotenv
import sqlalchemy as sa
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import SQLAlchemyError

# Carregar variáveis de ambiente do arquivo .env
load_dotenv()

# Configurações de conexão
REPORT_DB_NAME = os.getenv('REPORT_DB_NAME')
MARIADB_HOST = os.getenv('DB_HOST')
MARIADB_USERNAME = os.getenv('DB_USERNAME')
MARIADB_PASSWORD = os.getenv('DB_PASSWORD')

PG_HOST = os.getenv('PG_HOST')
PG_USERNAME = os.getenv('PG_USERNAME')
PG_PASSWORD = os.getenv('PG_PASSWORD')
PG_DB_NAME = os.getenv('PG_DB_NAME')

mariadb_url = f'mysql+pymysql://{MARIADB_USERNAME}:{MARIADB_PASSWORD}@{MARIADB_HOST}/{REPORT_DB_NAME}'
postgresql_url = f'postgresql+psycopg2://{PG_USERNAME}:{PG_PASSWORD}@{PG_HOST}/{PG_DB_NAME}'

# Conexão com MariaDB
mariadb_engine = sa.create_engine(mariadb_url)
MariadbSession = sessionmaker(bind=mariadb_engine)
mariadb_session = MariadbSession()

# Conexão com PostgreSQL
postgresql_engine = sa.create_engine(postgresql_url)
PostgresqlSession = sessionmaker(bind=postgresql_engine)
postgresql_session = PostgresqlSession()

# Função para criar a tabela schema_created se não existir
def create_schema_created_table():
    create_table_query = sa.text("""
    CREATE TABLE IF NOT EXISTS schema_created (
        id INT AUTO_INCREMENT PRIMARY KEY,
        database_name VARCHAR(255) NOT NULL,
        ID_Filial INT NOT NULL,
        schema_name VARCHAR(255) NOT NULL
    );
    """)
    mariadb_session.execute(create_table_query)
    mariadb_session.commit()

# Função para ler o arquivo unidade_modelo.sql
def read_sql_file(file_path):
    with open(file_path, 'r') as file:
        return file.read()

# Função para executar múltiplos comandos SQL
def execute_multiple_sql_commands(session, sql_commands):
    commands = sql_commands.split(';')
    for command in commands:
        if command.strip():
            session.execute(sa.text(command))
    session.commit()

# Função principal
def main():
    try:
        # Criar tabela schema_created se não existir
        create_schema_created_table()

        # Obter lista de databases
        database_list = mariadb_session.execute(sa.text("SELECT database_name FROM database_list")).fetchall()

        # Ler o conteúdo do arquivo unidade_modelo.sql
        sql_template = read_sql_file('unidade_modelo.sql')

        for db in database_list:
            database_name = db[0]

            # Selecionar quantidade de ceres_filiais
            ceres_filiais = mariadb_session.execute(sa.text(f"SELECT ID_Filial FROM {database_name}.ceres_filiais")).fetchall()

            for filial in ceres_filiais:
                id_filial = filial[0]
                schema_uuid = str(uuid.uuid4())
                schema_name = f"unidade_{schema_uuid}"

                # Substituir o nome do schema no template SQL
                schema_sql = sql_template.replace('unidade_modelo', schema_name)

                # Criar schema no PostgreSQL
                execute_multiple_sql_commands(postgresql_session, schema_sql)

                # Registrar no MariaDB
                insert_query = sa.text("""
                INSERT INTO schema_created (database_name, ID_Filial, schema_name)
                VALUES (:database_name, :ID_Filial, :schema_name)
                """)
                mariadb_session.execute(insert_query, {
                    'database_name': database_name,
                    'ID_Filial': id_filial,
                    'schema_name': schema_name
                })
                mariadb_session.commit()

    except SQLAlchemyError as e:
        print(f"Erro ao executar o script: {e}")
    finally:
        mariadb_session.close()
        postgresql_session.close()

if __name__ == "__main__":
    main()