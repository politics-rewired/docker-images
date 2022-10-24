FROM node:16.10.0-bullseye-slim

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  wget \
  apt-transport-https \
  ca-certificates gnupg \
  # Postgres 14 uses newer libreadline which is not available in package repos for the base Debian Bullseye image
  && wget -q -O - http://http.us.debian.org/debian/pool/main/r/readline/libreadline7_7.0-5_amd64.deb > /tmp/libreadline.deb \
  && echo "01e99d68427722e64c603d45f00063c303b02afb53d85c8d1476deca70db64c6 /tmp/libreadline.deb" | sha256sum -c \
  && dpkg -i /tmp/libreadline.deb \
  # Install Postgres 14 from official Postgres repo, since Bullseye is on Postgres 13
  && sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
  && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && apt-get update \
  && apt-get -y install postgresql-client-14 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
