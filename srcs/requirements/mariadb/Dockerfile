FROM	debian:bullseye

RUN		apt update -y && apt upgrade -y

RUN		apt install -y mariadb-server 

COPY	./tools/tools.sh /tmp/tools.sh

RUN		chmod +x /tmp/tools.sh

EXPOSE 3306

ENTRYPOINT [ "./tmp/tools.sh" ]