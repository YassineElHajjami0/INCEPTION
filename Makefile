all:
	docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d

build:
	docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d --build

start:
	docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env start

stop:
	docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/env stop

fclean:
	docker stop $$(docker ps -aq)
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	rm -rf ~/data