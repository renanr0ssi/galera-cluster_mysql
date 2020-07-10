FROM ubuntu:20.10
MAINTAINER Renan Rossi <renan.rossi@outlook.com>

ENV VERSION 20200710
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  software-properties-common && \
    apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 BC19DDBA && \
    apt-get update && \
    apt-get install -y galera-4 mysql-server-8.0  rsync lsof iputils-ping nano
RUN rm -r /var/lib/mysql/

COPY my.cnf /etc/mysql/my.cnf
COPY entrypoint.sh /entrypoint.sh
RUN chmod 700 /entrypoint.sh
EXPOSE 3306/tcp
ENTRYPOINT ["/entrypoint.sh"]

LABEL mysql_version=8.0
