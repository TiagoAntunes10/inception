FROM debian:bookworm

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y curl php php-mysql php8.2-fpm mariadb-client curl

COPY ./tools/setup.sh /

RUN chmod +x /setup.sh

ENTRYPOINT [ "/setup.sh" ]
