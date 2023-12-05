#!/bin/sh

sleep 5

cd /var/www/html
wp core download  --allow-root
wp config create  --dbname=$SQL_DATABASE--dbuser=$SQL_USER--dbpass=$SQL_PASSWORD--dbhost=$DB_HOST	--allow-root --path="/var/www/html"

wp core install --url=$DOMAIN_NAME \
				--title="my website" \
				--admin_user="yassine" \
				--admin_password="1234" \
				--admin_email="yassineelhajjami610@gmail.com" \
				--allow-root \
				--path="/var/www/html"

# wp user create	$WP_USER $WP_EMAIL \
# 				--user_pass=$WP_PASS \
# 				--role=$WP_ROLE \
# 				--allow-root

/usr/sbin/php-fpm7.4 -F