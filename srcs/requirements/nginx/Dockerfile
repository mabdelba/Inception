FROM debian:bullseye

RUN apt-get update &&  apt-get install -y nginx  openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/prive-cert.key -out /etc/ssl/certs/pub-cert.crt -subj "/C=KH/ST=Kouribga/L=Khouribga/O=Global Security/OU=IT Department/CN=1337.ma"

COPY ./conf/file.conf /etc/nginx/conf.d

CMD [ "nginx" , "-g", "daemon off;" ]


