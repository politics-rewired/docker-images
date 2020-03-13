FROM busybox

COPY tailglob tailglob

ENV LOG_GLOB="/home/postgres/pgdata/pgroot/pg_log/*.log"

CMD ["./tailglob"]
