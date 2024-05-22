import os
import pandas as pd
from sqlalchemy import create_engine
from fpdf import FPDF

DB_HOST = os.getenv('DB_HOST')
DB_USERNAME = os.getenv('DB_USERNAME')
DB_PASSWORD = os.getenv('DB_PASSWORD')
REDIS_HOST = os.getenv('REDIS_HOST')

# Define the database URL template
DATABASE_URL_TEMPLATE = 'mysql+pymysql://{username}:{password}@{host}/report_db'

# Format the template with actual values
DATABASE_URL = DATABASE_URL_TEMPLATE.format(username=DB_USERNAME, password=DB_PASSWORD, host=DB_HOST)

engine = create_engine(DATABASE_URL)

def fetch_execution_logs():
    query = """
    SELECT container_id, database_name, status, execution_time, timestamp
    FROM execution_logs
    """
    df = pd.read_sql(query, engine)
    return df

def generate_report(df):
    report = FPDF()
    report.add_page()

    report.set_font("Arial", size=12)
    report.cell(200, 10, txt="Execution Report", ln=True, align="C")

    # Number of executions for each container
    report.cell(200, 10, txt="Number of executions for each container:", ln=True, align="L")
    executions_per_container = df['container_id'].value_counts()
    for container_id, count in executions_per_container.items():
        report.cell(200, 10, txt=f"{container_id}: {count}", ln=True, align="L")

    report.ln(10)

    # Databases that succeeded or failed for each container
    report.cell(200, 10, txt="Databases that succeeded or failed for each container:", ln=True, align="L")
    success_fail_per_container = df.groupby(['container_id', 'database_name', 'status']).size().reset_index(name='count')
    for index, row in success_fail_per_container.iterrows():
        report.cell(200, 10, txt=f"{row['container_id']} - {row['database_name']} - {row['status']}: {row['count']}", ln=True, align="L")

    report.ln(10)

    # Average time of each container execution
    report.cell(200, 10, txt="Average time of each container execution:", ln=True, align="L")
    avg_time_per_container = df.groupby('container_id')['execution_time'].mean().reset_index()
    for index, row in avg_time_per_container.iterrows():
        report.cell(200, 10, txt=f"{row['container_id']}: {row['execution_time']:.2f} seconds", ln=True, align="L")

    report.output("execution_report.pdf")

if __name__ == '__main__':
    df = fetch_execution_logs()
    generate_report(df)
