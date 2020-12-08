export SPARK_HOME=$(python /opt/miniconda3/bin/find_spark_home.py)
export POSTGRES_JAR=postgresql-42.2.18.jar
export POSTGRES_JAR_PATH="$SPARK_HOME/jars/$POSTGRES_JAR"
export SPARK_JARS="$POSTGRES_JAR"
curl -s -L --url "https://jdbc.postgresql.org/download/$POSTGRES_JAR" --output "$POSTGRES_JAR"
