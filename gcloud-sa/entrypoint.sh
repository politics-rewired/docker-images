#!/bin/sh
set -x

gcloud auth activate-service-account --key-file="$GCP_KEY_FILE_PATH"

exec "$@"
