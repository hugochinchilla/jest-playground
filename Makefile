PROJECT = jest-playground
.DEFAULT_GOAL := test-docker

.PHONY: test
test: node_modules
	npm test

.PHONY: test-docker
test-docker: .docker-build
	docker run --rm -v $(PWD):/app $(PROJECT) npm test -- --color

node_modules:
	npm ci

.docker-build: package-lock.json
	docker build -t $(PROJECT) .
	touch .docker-build

