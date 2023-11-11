FROM	debian:bullseye

RUN		apt update -y && \
		apt install -y mariadb-server 

COPY	./tools/tools.sh /tmp/

RUN		chmod +x /tmp/tools.sh

ENTRYPOINT [ "sh", "/tmp/tools.sh" ]