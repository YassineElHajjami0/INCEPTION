#!/bin/sh

rm -rf /var/www/wordpress/wp-config-sample.php
cat << EOF > /var/www/wordpress/wp-config.php
<?php
define( 'DB_NAME', '$SQL_DATABASE' );
define( 'DB_USER', '$SQL_USER' );
define( 'DB_PASSWORD', '$SQL_PASSWORD' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
EOF