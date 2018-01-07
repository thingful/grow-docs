.PHONY: docker-build
docker-build: ## build the docker image, installs the required packages and tags the image
	docker build -t thingful/grow-docs .

.PHONY: docker-dev 
docker-dev: ## run the docker container and mounts the app directory on the container
	docker run --name thingful-grow-docs -v `pwd`:/src/app -p 3000:3000 -p 5000:5000 -d thingful/grow-docs

.PHONY: docker-rm
docker-rm: ## removes the 'thingful-grow-docs' docker container
	docker rm thingful-grow-docs

.PHONY: help 
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

