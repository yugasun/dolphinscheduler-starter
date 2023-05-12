FROM eclipse-temurin:8-jdk-focal

ARG VERSION=3.1.5

ENV VERSION $VERSION
ENV DOCKER true
ENV TZ Asia/Shanghai
ENV DS_HOME /opt/dolphinscheduler
ENV PYTHON_HOME /usr

RUN apt update ; \
  apt install -y sudo gcc make python; \
  rm -rf /var/lib/apt/lists/*

WORKDIR $DS_HOME

ADD ./build/apache-dolphinscheduler-${VERSION}-bin $DS_HOME

COPY ./build/jdbc/* $DS_HOME/alert-server/libs/
COPY ./build/jdbc/* $DS_HOME/api-server/libs/
COPY ./build/jdbc/* $DS_HOME/master-server/libs/
COPY ./build/jdbc/* $DS_HOME/worker-server/libs/

EXPOSE 12345 25333

CMD [ "/bin/bash", "/opt/dolphinscheduler/standalone-server/bin/start.sh"]
