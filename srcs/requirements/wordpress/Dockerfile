FROM debian:bullseye

RUN apt update
RUN apt install vim -y
RUN apt-get -y install wget
RUN apt-get install -y php7.3\
    php-fpm\
    php-mysql\
    mariadb-client

COPY ./tools/tools.sh .
RUN chmod +x tools.sh && ./tools.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/script.sh .
RUN chmod +x script.sh && ./script.sh

CMD ["/usr/sbin/php-fpm7.3",  "-F"]
E1 is Hot :fire: 