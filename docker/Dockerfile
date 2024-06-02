FROM ubuntu:24.04
WORKDIR /usr/local/bin

RUN DEBIAN_FRONTEND=noninteractive apt update && apt install --quiet --yes --no-install-recommends \
    software-properties-common \
    sudo \
    curl \
    git \
    ssh \
    build-essential

