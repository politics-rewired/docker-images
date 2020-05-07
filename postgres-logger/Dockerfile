FROM alpine:latest

# Install dumb-init
COPY dumb-init_1.2.2_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

ENV LOG_DIR="/home/postgres/pgdata/pgroot/pg_log"
ENV LOG_NAME="postgresql"
ENV LOG_GLOB="/home/postgres/pgdata/pgroot/pg_log/*.log"

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]

# Expand envvars using sh -c
# Replace `sh` process with `tail` by using exec
CMD ["sh", "-c", "for i in $(seq 1 7); do touch ${LOG_DIR}/${LOG_NAME}-$i.log && chown 101:103 ${LOG_DIR}/${LOG_NAME}-$i.log; done && exec tail -q -n+1 -F ${LOG_GLOB}"]
