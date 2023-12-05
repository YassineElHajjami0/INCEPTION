FROM debian:bullseye

RUN apt update
RUN apt install nginx -y
RUN apt install vim -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/ST=Béni Mellal-Khénifra/L=Khouribga/O=42/OU=42/CN=yel-hajj.42.fr/UID=yel-hajj"
RUN mkdir -p /var/run/nginx
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
CMD [ "nginx", "-g", "daemon off;" ]