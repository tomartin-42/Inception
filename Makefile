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
	mkdir -p $(HOME)/data/
	docker compose -f $(COMPOSE_PATH) up -d

clean: 
	docker compose -f $(COMPOSE_PATH) down
	docker rm -f $(ALL_CONTAINERS)
	docker volume rm $(ALL_VOLUMES)

reset:
	docker rm $(ALL_CONTAINERS) -f
	docker volume rm $(ALL_VOLUMES)
	docker system prune -af
	sudo rm -r $(HOME)/data

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

inM:
	docker exec -it MariaDB bash

inrN:
	docker exec -it NGINX bash
