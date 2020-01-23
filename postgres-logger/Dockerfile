FROM busybox

ENV LOG_GLOB="/home/postgres/pgdata/pgroot/pg_log/*.log"

CMD ["/bin/sh", "-c", "tail -n+1 -f ${LOG_GLOB}"]
