#!/bin/sh

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

wp core config --dbhost=mariadb-container  --dbname=wordpress --dbuser=mabdelba --dbpass=0000 --allow-root

sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g" /etc/php/7.4/fpm/pool.d/www.conf

php-fpm7.4 -F

# sleep 10000

# php-fpm7.4 -F
#/etc/php/7.4/fpm/pool.d
# listen = /run/php/php7.4-fpm.sock