# docker-rails
Docker Rails image for development purposes, based on Alpine Linux

# Building

## Building for Dev
As this image should create files on your machine with the same owner as your dev user, you should build it like this:

```bash
docker build . --tag my-rails-dev --build-arg uid=${UID}
```

If you have no Rails project yet and need `rails new` at least:
```bash
docker build . --tag my-rails-dev-bootstrap --build-arg uid=${UID} --build-arg bundle_path=/bundle --build-arg rails_version=5.1.4
```
Little bit ugly for now, but we're working on it...

## Building for Production
This container can be an example or the base for production container so it is better to use it in `FROM` directive
of your own dockerfile. But anyway building it's descendants in production mode is as simple as:
```bash
docker build . --tag my-rails-prod
```

# Usage examples

Mount your volumes with :Z access pattern to avoid SElinux troubles.
See https://stackoverflow.com/a/31334443 for more information.

## Creating a new rails app

### Sqlite3
```bash
docker run --rm -v $(pwd):/service:Z my-rails-dev-bootstrap rails new testapp-sqlite3
```

### PostgreSQL
```bash
docker run --rm -v $(pwd):/service:Z my-rails-dev-bootstrap rails new testapp-postgresql --database postgresql
```

### MySQL
```bash
docker run --rm -v $(pwd):/service:Z my-rails-dev-bootstrap rails new testapp-mysql --database mysql
```

## Working in existing app

In order to get access to the shell:
```bash
docker run -it --rm -v $(pwd):/service:Z my-rails-dev /bin/sh
```

If running the container first time run `bundle install` first when inside. You can use this  


