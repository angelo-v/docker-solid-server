test:
	docker run --rm -t \
		-u "$(shell id -u):$(shell id -g)" \
		-v $(shell pwd):/project \
		-v /var/run/docker.sock:/var/run/docker.sock:ro \
		aveltens/docker-testinfra

.PHONY: test