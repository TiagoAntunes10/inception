FROM debian:bookworm

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY ./tools/setup.sh /setup.sh

RUN chmod +x /setup.sh

RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT [ "/setup.sh" ]

CMD [ "mysql_safe" ]
