#!/bin/sh

sleep 20

cd /var/www/html

sed -i 's/^listen = .*/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf

if [ ! -e index.php ]; then
    wp core download --allow-root
fi

if [ ! -e wp-config.php ]; then
    wp config create --dbname=$SQL_DATABASE \
                     --dbuser=$SQL_USER \
                     --dbpass=$SQL_PASSWORD \
                     --dbhost=$DB_HOST \
                     --allow-root \
                     --path="/var/www/html"
fi

wp core install --url=$DOMAIN_NAME \
				--title=$TITLE \
				--admin_user=$ADMINUSER \
                --skip-email \
				--allow-root \
				--admin_password=$ADMINPASS\
				--admin_email=$ADMINMAIL --path="/var/www/html"

wp user create $NORMALUSER $NORMALUSEREMAIL --allow-root\
        --role=$WP_ROLE \
        --user_pass=$NORMALUSERPASS \
        --path="/var/www/html"

/usr/sbin/php-fpm7.4 -F