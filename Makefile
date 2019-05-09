test: ## run testinfra tests against the project
	docker run --rm -t \
		-v $(shell pwd):/project \
		-v /var/run/docker.sock:/var/run/docker.sock:ro \
		aveltens/docker-testinfra

build: ## build the docker image
	docker build --file ./src/Dockerfile --tag aveltens/solid-server .

inspect: build ## run a shell in the docker image
	docker run --rm -it --entrypoint sh aveltens/solid-server

start: build ## start solid-server docker container
	docker run --rm \
		-it -d \
		-p 8443:8443 \
		-u "$(id -u):$(id -g)" \
		-v $(shell pwd)/data:/opt/solid/data \
		--name solid-server \
		aveltens/solid-server

stop: ## stop the solid-server docker container
	docker stop solid-server

attach: ## execute a shell in the running solid-server docker container
	docker exec -it solid-server sh

.PHONY: test build inspect run attach
