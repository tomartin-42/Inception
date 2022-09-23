RCS_PATH = srcs/
COMPOSE_PATH = $(RCS_PATH)docker-compose.yaml
REQS_PATH = $(SRCS_PATH)requirements/

NGINX_PATH = $(REQS_PATH)NGINX/
NGINX_CONTAINER = NGINX

MARIADB_PATH = $(REQS_PATH)MariaDB/
MARIADB_CONTAINER = MariaDB

WP_PATH = $(REQS_PATH)WordPress
WP_CONTAINER = WordPress

ALL_CONTAINERS:= $(shell docker ps -a -q)
ALL_VOLUMES:= $(shell docker volume ls -q)

all:
	mkdir /home/tomartin/Inception/data/webserver/wordpress
	mkdir /home/tomartin/Inception/data/mysql
	docker compose -f $(COMPOSE_PATH) up -d

clean: 
	docker compose -f $(COMPOSE_PATH) down
	docker rm -f $(ALL_CONTAINERS)
	docker volume rm $(ALL_VOLUMES)

reset:
	docker rm $(ALL_CONTAINERS) -f
	docker volume rm $(ALL_VOLUMES)
	docker system prune -af
	rm -rf /home/tomartin/Inception/data/webserver/wordpress
	rm -rf /home/tomartin/Inception/data/mysql

re: reset all

del_volumes:
	docker volume rm $(ALL_VOLUMES)


stop:
	docker compose -f $(COMPOSE_PATH) down

prune:
	docker system prune -af

down_up: clean all

down:
	docker compose -f $(COMPOSE_PATH) down

inW:
	docker exec -it WordPress bash
