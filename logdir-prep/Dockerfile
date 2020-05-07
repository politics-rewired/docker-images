FROM busybox:1.31.1

ENV LOG_DIR="/home/postgres/pgdata/pgroot/pg_log"

CMD ["sh", "-c", "echo 'hello' && ls ${LOG_DIR} && exec for i in {1..7} do touch ${LOG_DIR}/postgres-$i.log done"]
