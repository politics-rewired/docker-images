# Zalando Postgres Log Directory Prep

Zalando's `postgres-operator` allows adding sidecars, but not specifying the command or command args for these commands. This image is a workaround that just sets the CMD to touch daily log files in a logs directory.

Running:

```sh
docker run  \
  --env "LOG_DIR=/home/postgres/pgdata/pgroot/pg_log"  \
  gcr.io/assemble-services/logdir-prep:latest
```

Building:

```
docker build . -t gcr.io/assemble-services/logdir-prep:$(git rev-parse HEAD)
docker tag gcr.io/assemble-services/logdir-prep:$(git rev-parse HEAD) gcr.io/assemble-services/logdir-prep:latest
docker push gcr.io/assemble-services/logdir-prep
```
