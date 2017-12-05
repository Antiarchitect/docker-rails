# docker-rails
Docker Rails image based on Alpine Linux

## Usage examples

Mount your volumes with :Z access pattern to avoid SElinux troubles.
See https://stackoverflow.com/a/31334443 for more information.

### Sqlite3
```bash
docker run --rm -v $(pwd):/service:Z antiarchitect/docker-rails rails new testapp-sqlite3
```

### PostgreSQL
```bash
docker run --rm -v $(pwd):/service:Z antiarchitect/docker-rails rails new testapp-postgresql --database postgresql
```

### MySQL
```bash
docker run --rm -v $(pwd):/service:Z antiarchitect/docker-rails rails new testapp-mysql --database mysql
```
