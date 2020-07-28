.DEFAULT_GOAL:=help
CUR_DIR:=$$(pwd)
CONTAINER_NAME=qa-newrelic-slo

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

prepare: ## Install New Relic profile
	docker exec -it ${CONTAINER_NAME} bash /opt/quality-assurance-newrelic-slo/setup.sh

create: ## Create a new Nerdpack project
	docker exec -it ${CONTAINER_NAME} nr1 create --type nerdpack --name ${PROJECT_NAME}

run: ## Run a Nerdpack project
	docker exec -it ${CONTAINER_NAME} bash -c 'cd ${PROJECT_NAME} && nr1 nerdpack:serve'

remove: ## Remove a Nerdpack project
	docker exec -it ${CONTAINER_NAME} rm -Rf ${PROJECT_NAME}
