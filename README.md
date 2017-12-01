# docker-rails
Docker Rails image based on Alpine Linux

## Usage examples

### Sqlite3
```bash
docker run --rm --privileged=true -v $(pwd):/service antiarchitect/docker-rails rails new testapp-sqlite3
```

### PostgreSQL
```bash
docker run --rm --privileged=true -v $(pwd):/service antiarchitect/docker-rails rails new testapp-postgresql --database postgresql
```

### MySQL
```bash
docker run --rm --privileged=true -v $(pwd):/service antiarchitect/docker-rails rails new testapp-mysql --database mysql
```
