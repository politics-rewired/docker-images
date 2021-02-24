#!/bin/sh

gcloud auth activate-service-account --key-file="$GCP_KEY_FILE_PATH"

output=$("$@" 2>&1)

retVal="$?"
if [ $retVal -ne 0 ]; then
  # Create .msmtprc interpolated with envvars
  ( echo "cat <<EOF" ; cat msmtprc.tpl ; echo EOF ) | sh > /etc/msmtprc

  # Create attachment
  echo "$output" > /tmp/output.log
  attachment=$(openssl base64 < /tmp/output.log)

  # Send email using raw format
  cat <<EOF | sendmail "$SMTP_TO"
To: $SMTP_TO
Subject: Error running gcloud command
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="messageBoundary"

--messageBoundary
content-type: text/plain

Command exited with $retVal:

  $@

--messageBoundary
Content-Type: text/plain; charset=utf-8; name=output.log
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=output.log

$attachment

--messageBoundary
EOF
fi
