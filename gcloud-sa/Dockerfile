FROM gcr.io/google.com/cloudsdktool/cloud-sdk:329.0.0

WORKDIR /app

ADD entrypoint.sh /app
ADD msmtprc.tpl /app

RUN apt-get update && apt-get install -y msmtp msmtp-mta

ENTRYPOINT [ "/app/entrypoint.sh" ]
