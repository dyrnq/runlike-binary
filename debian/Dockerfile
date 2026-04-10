#FROM python:3.14.4-trixie
FROM python:3.13.6-bullseye AS builder

ARG VERSION
ENV \
DEBIAN_FRONTEND=noninteractive \
LANG=en_US.utf8 \
VERSION=${VERSION:-v1.6.3}

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

COPY ./go.sh /go.sh
RUN /bin/bash /go.sh ${VERSION}

FROM debian:bullseye
ENV DEBIAN_FRONTEND=noninteractive LANG=en_US.utf8
RUN \
apt update; \
apt install bash ca-certificates curl jq wget -y; \
curl -fsSL https://get.docker.com -o get-docker.sh; \
apt update; \
bash ./get-docker.sh; \
rm -rf ./get-docker.sh; \
rm -rf /var/lib/apt/lists/*
COPY --from=builder /runlike/dist/runlike /usr/local/bin/runlike
ENTRYPOINT ["runlike"]
