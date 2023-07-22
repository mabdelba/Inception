FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

EXPOSE 3306

COPY ./conf/file.sh ./conf/file.sh

CMD ["bash", "./conf/file.sh"]