CREATE TABLE execution_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    container_id VARCHAR(255),
    database_name VARCHAR(255),
    status VARCHAR(50),
    execution_time FLOAT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);
