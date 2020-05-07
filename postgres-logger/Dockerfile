FROM alpine:latest

# Install dumb-init
COPY dumb-init_1.2.2_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

ENV LOG_GLOB="/home/postgres/pgdata/pgroot/pg_log/*.log"

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
# This works: k exec acid-sandbox-cluster-0 -c pglogger -- sh -c 'exec tail -n+1 -F ${LOG_GLOB}'
CMD ["sh", "-c", "exec tail -n+1 -F ${LOG_GLOB}"]
