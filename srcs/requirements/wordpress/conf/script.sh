#!/bin/sh

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

wp core config --dbhost=mariadb-container  --dbname=wordpress --dbuser=mabdelba --dbpass=0000 --allow-root

sleep 10000
