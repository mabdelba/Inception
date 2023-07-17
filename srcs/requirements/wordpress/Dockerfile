FROM debian:bullseye

WORKDIR /var/www/html

RUN apt update && apt install -y curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN apt install -y php mariadb-client

COPY ./conf/script.sh /conf/script.sh

CMD [ "bash", "/conf/script.sh"]

