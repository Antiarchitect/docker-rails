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
    nodejs

ARG workdir=/service
WORKDIR ${workdir}

ARG rails_version
RUN [ "x${rails_version}" = "x" ] || mkdir /bundle

# Use --build-arg bundle_path=/bundle for bootstrapping.
ARG bundle_path=${workdir}/.bundle

# Conditional user change for Dev
ARG uid
RUN [ "x${uid}" = "x" ] || adduser -D -u ${uid} dev
RUN [ "x${rails_version}" = "x" ] || chown ${uid} /bundle
USER ${uid:-${UID}}

## Proper env var settings
ENV GEM_HOME=${bundle_path}
ENV BUNDLE_APP_CONFIG=${GEM_HOME}
ENV BUNDLE_PATH=${GEM_HOME}
ENV BUNDLE_BIN=${GEM_HOME}/bin
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN [ "x${rails_version}" = "x" ]  || gem install rails -v ${rails_version} --no-document