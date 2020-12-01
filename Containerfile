FROM python:alpine3.12

ENV DB_DIRECTORY=/data \
    ALLOW_ROOT=1 \
    ANON_LOGS=1

ADD install.sh /bin
RUN apk add --no-cache ca-certificates curl leveldb build-base leveldb-dev; \
    /bin/sh /bin/install.sh; \
    apk del build-base leveldb-dev
