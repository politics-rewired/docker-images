# Zalando Postgres Logger

Zalando's `postgres-operator` allows adding sidecars, but not specifying the command or command args for these commands. This image is a comple image that will tail a glob pattern supplied in an envvar.

Running:

```sh
docker run  \
  --env "LOG_GLOB=/home/postgres/pgdata/pgroot/pg_log/*.log"  \
  gcr.io/assemble-services/postgres-logger:latest
```

This uses [`dumb-init`](https://github.com/Yelp/dumb-init) to handle trapping signals. We include this in version control and source it locally because the `busybox` image does not support `wget` with TLS validation.

Building:

```
docker build . -t gcr.io/assemble-services/postgres-logger:$(git rev-parse HEAD)
docker tag gcr.io/assemble-services/postgres-logger:$(git rev-parse HEAD) gcr.io/assemble-services/postgres-logger:latest
docker push gcr.io/assemble-services/postgres-logger
```
