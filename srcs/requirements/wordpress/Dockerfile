FROM debian:bullseye

# RUN apt update
# RUN apt install vim -y
# RUN apt-get -y install wget
# RUN apt-get install -y php7.3\
#     php-fpm\
#     php-mysql\
#     mariadb-client

# COPY ./tools/tools.sh .
# RUN chmod +x tools.sh && ./tools.sh

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

# FROM debian:bullseye

RUN apt update
RUN apt install -y vim wget mariadb-client

# Install PHP and other necessary components (add your PHP installation steps here)

COPY ./tools/tools.sh .
RUN chmod +x tools.sh && ./tools.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN wp config create	--allow-root \
    --dbname=$SQL_DATABASE \
    --dbuser=$SQL_USER \
    --dbpass=$SQL_PASSWORD \
    --dbhost=172.18.0.2:3306 --path='/var/www/wordpress'


CMD ["/usr/sbin/php-fpm7.3",  "-F"]
`