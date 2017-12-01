FROM ruby:2.4.2-alpine3.6

LABEL maintainer "Antiarchitect <voronkovaa@gmail.com>"

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

RUN gem install rails -v 5.1.4 --no-document

#RUN apk add --no-cache \
#    postgresql-client \
#    libpq \
#    nodejs \
#    tzdata
#RUN apk del .build-deps