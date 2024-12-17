FROM ubuntu:22.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive TZ=Europe/Amsterdam

RUN apt update && apt upgrade -y
RUN apt install -y make build-essential libssl-dev zlib1g-dev \
       libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
       libncurses5-dev libncursesw5-dev xz-utils tk-dev
RUN apt clean

ARG PYTHON_VERSION=3.11.11
ARG BUILD_OPTIONS=""

WORKDIR /build
RUN wget "https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz"
RUN tar -xvf Python-${PYTHON_VERSION}.tgz
RUN cd Python-${PYTHON_VERSION} && \
    ./configure --prefix=/usr/local/python${PYTHON_VERSION} ${BUILD_OPTIONS} && \
    make -j $(nproc) && \
    make altinstall

WORKDIR /pkg
RUN tar -czf python${PYTHON_VERSION}.tar.gz -C /usr/local python${PYTHON_VERSION}

FROM ubuntu:22.04

ARG PYTHON_VERSION=3.11.11

WORKDIR /pkg
COPY --from=builder /pkg/python${PYTHON_VERSION}.tar.gz .
