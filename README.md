# procer-testes-carga

## Deploy the Stack:

```
docker stack deploy -c docker-compose.yml ceres_testes_carga
```

## Scale the Services:

```
docker service scale ceres_stack_ceres_medicoes_info=2000
docker service scale ceres_stack_ceres_medicoes_historico=2000
```
## Excuting the stress test

1. Run the fetch script to store database names in Redis:

```
python fetch_databases.py
```

1. Deploy the Docker stack and scale the services as described earlier.
1. To generate the PDF report, run the report generation script:

```
DATABASE_URL="mysql+pymysql://user:password@db_host/report_db" python generate_report.py
```

