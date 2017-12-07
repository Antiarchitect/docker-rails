# docker-rails
Docker Rails image for development purposes, based on Alpine Linux

## Building for Dev
As this image should create files on your machine with the same owner as your dev user, you should build it like this:

```bash
docker build . --tag my-rails-dev --build-arg uid=${UID}
```

## Building for Production
Much simpler:
```bash
docker build . --tag my-rails-prod
```

## Usage examples

Mount your volumes with :Z access pattern to avoid SElinux troubles.
See https://stackoverflow.com/a/31334443 for more information.

### Sqlite3
```bash
docker run --rm -v $(pwd):/service:Z my-rails-dev rails new testapp-sqlite3
```

### PostgreSQL
```bash
docker run --rm -v $(pwd):/service:Z my-rails-dev rails new testapp-postgresql --database postgresql
```

### MySQL
```bash
docker run --rm -v $(pwd):/service:Z my-rails-dev rails new testapp-mysql --database mysql
```
