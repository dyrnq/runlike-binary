#FROM python:3.14.4-trixie
FROM python:3.13.6-bullseye

RUN apt update && apt install -y --no-install-recommends \
    curl \
    wget \
    jq \
    bash \
    git \
    binutils \
    libc6-dev \
    gcc \
    g++ \
    make \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

