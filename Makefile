test:
	docker run --rm -t \
		-v $(shell pwd):/project \
		-v /var/run/docker.sock:/var/run/docker.sock:ro \
		aveltens/docker-testinfra

build:
	docker build -t aveltens/solid-server ./src

inspect: build
	docker run --rm -it aveltens/solid-server sh

.PHONY: test build inspect