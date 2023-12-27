FROM debian:bullseye

RUN apt update -y
RUN apt install -y php7.4-fpm\
    php7.4-mysql\
    mariadb-client\
    curl\
    sendmail

RUN mkdir -p /var/www/html

RUN mkdir -p /run/php/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/tools.sh .
RUN chmod +x tools.sh

EXPOSE 9000

ENTRYPOINT [ "./tools.sh" ]