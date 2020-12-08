FROM godatadriven/pyspark:3.0.1


ADD . /var/docker/data-engineering

WORKDIR /var/docker/data-engineering/setup
RUN sh nix.sh
RUN sh spark.sh
RUN sh python.sh