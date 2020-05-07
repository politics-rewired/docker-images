FROM busybox:1.31.1

ENV LOG_DIR="/home/postgres/pgdata/pgroot/pg_log"
ENV LOG_NAME="postgresql"

CMD ["sh", "-c", "echo 'starting...' && for i in $(seq 1 7); do touch ${LOG_DIR}/${LOG_NAME}-$i.log; done && ls ${LOG_DIR}"]
