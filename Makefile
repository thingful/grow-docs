# Makefile for Thingful Grow Node documentation
#
# Author: m4rco

HOST_DOCS_PORT = 3000
DOCKER_DOCS_PORT = 3000
HOST_SWAGGER_PORT = 5000
DOCKER_SWAGGER_PORT = 5000

# override default documentation port if set
ifdef docs_port
	HOST_DOCS_PORT = $(docs_port)
endif

# override default swagger_port port if set
ifdef swagger_port
	HOST_SWAGGER_PORT = $(swagger_port)
endif

.PHONY: docker-build
docker-build: ## build the docker image, installs the required packages and tags the image.
	docker build -t thingful/grow-docs .

.PHONY: docker-dev
docker-dev: ## run the docker container and mounts the app directory on the container. Host ports can be overidden by using the 'docs_port' and 'swagger_port' options.
	docker run --name thingful-grow-docs \
		-v `pwd`:/src/app -p $(HOST_DOCS_PORT):$(DOCKER_DOCS_PORT) \
		-p $(HOST_SWAGGER_PORT):$(DOCKER_SWAGGER_PORT) \
		-d thingful/grow-docs

.PHONY: docker-rm
docker-rm: ## removes the 'thingful-grow-docs' docker container.
	docker rm thingful-grow-docs

.PHONY: help
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
