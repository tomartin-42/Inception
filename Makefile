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

all:
	docker compose -f $(COMPOSE_PATH) up -d

reset:
	docker rm $(ALL_CONTAINERS) -f
	docker system prune -af

re: reset all
