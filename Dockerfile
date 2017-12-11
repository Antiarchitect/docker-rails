# One Dockerfile for Prod and Dev environments. See build instructions in README.md.
FROM ruby:2.4.2-alpine3.6
LABEL maintainer="Antiarchitect <voronkovaa@gmail.com>"

RUN apk add --no-cache \
    gcc \
    g++ \
    make \
    musl-dev
RUN apk add --no-cache \
    sqlite-dev \
    postgresql-dev \
    mariadb-dev \
    nodejs \
    tzdata

ARG gemdev
RUN [ "x${gemdev}" = "x" ] || apk add --no-cache git

ARG workdir="/service"
WORKDIR ${workdir}

# Conditional user change for Dev
ARG uid
RUN [ "x${uid}" = "x" ] || adduser -D -u ${uid} dev
USER ${uid:-${UID}}

# Local project binaries
ENV PATH="${workdir}/vendor/bundle/bin:${PATH}"
ENV BUNDLE_APP_CONFIG="${workdir}/.bundle"

ARG rails_version
RUN [ "x${rails_version}" = "x" ] || gem install rails -v ${rails_version} --no-document