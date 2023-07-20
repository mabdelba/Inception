#!/bin/sh

while ! mysqladmin ping -h mariadb -u mabdelba --password=0000 >/dev/null 2>&1; do
    sleep 1
done


if [ ! -f /var/www/html/wp-config.php ]; then
###
wp core download --allow-root

wp core config --dbhost=mariadb  --dbname=wordpress --dbuser=mabdelba --dbpass=0000 --allow-root

wp core install --url=$DOMAIN_NAME --title=inception --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PW --admin_email=$WP_ADMIN_EMAIL --allow-root

wp user create $WP_USER $WP_EMAIL --user_pass=$WP_PW --role=subscriber --allow-root
fi
###
sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g" /etc/php/7.4/fpm/pool.d/www.conf
echo "php fpm running ..."
php-fpm7.4 -F

# sleep 10000

# php-fpm7.4 -F
#/etc/php/7.4/fpm/pool.d
# listen = /run/php/php7.4-fpm.sock