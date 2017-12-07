# One Dockerfile for Prod and Dev environments. See build instructions in README.md.
FROM ruby:2.4.2-alpine3.6
LABEL maintainer="Antiarchitect <voronkovaa@gmail.com>"

ARG uid

WORKDIR /service

RUN apk add --no-cache \
    gcc \
    g++ \
    make \
    musl-dev
RUN apk add --no-cache \
    sqlite-dev \
    postgresql-dev \
    mariadb-dev

RUN [ "x${uid}" = "x" ] || addgroup -g ${uid} dev
RUN [ "x${uid}" = "x" ] || adduser -D -u ${uid} -G dev dev
USER ${uid:-$UID}:${uid:-$UID}

RUN gem install rails -v 5.1.4 --no-document