FROM busybox:1.31.1

ENV LOG_DIR="/home/postgres/pgdata/pgroot/pg_log"

CMD ["sh", "-c", "echo 'starting...' && ls ${LOG_DIR} && for i in $(seq 1 7); do touch ${LOG_DIR}/postgres-$i.log; done && ls ${LOG_DIR}"]
