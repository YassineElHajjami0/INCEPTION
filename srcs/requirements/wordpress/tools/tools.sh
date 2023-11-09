#!/bin/sh

wget https://fr.wordpress.org/wordpress-6.3-fr_FR.tar.gz -P /var/www
cd /var/www && tar -xzf wordpress-6.3-fr_FR.tar.gz && rm wordpress-6.3-fr_FR.tar.gz
chown -R root:root /var/www/wordpress
echo "clear_env = no" >> /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = wordpress:9000/' /etc/php/7.4/fpm/pool.d/www.conf
