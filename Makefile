PYTHON_VERSION ?= 3.11.11
INSTALL_DIR ?= "$$HOME/.python/"

build:
	@docker build --tag python:${PYTHON_VERSION} \
	--build-arg=PYTHON_VERSION=${PYTHON_VERSION} \
	.

extract:
	CONTAINER_ID=$(shell docker create python:${PYTHON_VERSION}) && \
	docker cp $$CONTAINER_ID:/pkg/python${PYTHON_VERSION}.tar.gz . && \
	docker rm $$CONTAINER_ID

install: extract
	tar -xzf python${PYTHON_VERSION}.tar.gz -C ${INSTALL_DIR}
	rm python${PYTHON_VERSION}.tar.gz
