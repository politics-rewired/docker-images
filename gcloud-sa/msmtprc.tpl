defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
syslog on

account default
host $SMTP_HOST
port $SMTP_PORT
auth on
user $SMTP_USER
password $SMTP_PASSWORD
from $SMTP_FROM
