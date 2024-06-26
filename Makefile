# Define variables for the Docker Compose file and stack name
DOCKER_COMPOSE_FILE=docker-compose.yml
STACK_NAME=testes_carga

# Define image names
IMAGE_MEDICOES_INFO=ceres_medicoes_info
IMAGE_MEDICOES_HISTORICO=ceres_medicoes_historico
IMAGE_HISTORICO=ceres_historico

# Define the build context and Dockerfile paths
BUILD_CONTEXT=.
DOCKERFILE_MEDICOES_INFO=Dockerfile.ceres_medicoes_info
DOCKERFILE_MEDICOES_HISTORICO=Dockerfile.ceres_medicoes_historico
DOCKERFILE_HISTORICO=Dockerfile.ceres_historico

# Target to build the Docker images
build:
	docker build -t $(IMAGE_MEDICOES_INFO) -f $(DOCKERFILE_MEDICOES_INFO) $(BUILD_CONTEXT)
	docker build -t $(IMAGE_HISTORICO) -f $(DOCKERFILE_HISTORICO) $(BUILD_CONTEXT)

# Target to deploy the Docker stack
deploy: build
	docker stack deploy -c $(DOCKER_COMPOSE_FILE) $(STACK_NAME)

# Target to scale the services
scale:
	docker service scale $(STACK_NAME)_ceres_medicoes_info=2000
	docker service scale $(STACK_NAME)_ceres_medicoes_historico=2000

# Target to remove the Docker stack
remove:
	docker stack rm $(STACK_NAME)

# Target to clean up the Docker images
clean:
	docker rmi $(IMAGE_MEDICOES_INFO) $(IMAGE_HISTORICO)

# Target to initialize Docker Swarm
init:
	docker swarm init

# Target to run the fetch_databases script
fetch:
	python fetch_databases.py

# Target to generate the report
report:
	DATABASE_URL="mysql+pymysql://user:password@db_host/report_db" python generate_report.py
