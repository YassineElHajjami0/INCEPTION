
build:
	docker-compose -f ./srcs/docker-compose.yml up --build -d 

start:
	docker-compose -f ./srcs/docker-compose.yml start

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

fclean:
	docker stop $$(docker ps -aq)
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	rm -rf ~/data

down:
	docker compose -f ./srcs/docker-compose.yml down --remove-orphans