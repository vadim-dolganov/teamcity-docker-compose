COMPOSE_FILE=docker-compose.yml

all: uplog

update: stop down build uplog

uplog:
	docker-compose -f $(COMPOSE_FILE) up -d && docker-compose -f $(COMPOSE_FILE) logs -f -t --tail=10

stop:
	docker-compose -f $(COMPOSE_FILE) stop

build:
	docker-compose -f $(COMPOSE_FILE) build --pull --no-cache

down:
	docker-compose -f $(COMPOSE_FILE) down --rmi all

backup:
	docker exec -it postgres /usr/local/bin/backup

restore:
	docker exec -it postgres /usr/local/bin/restore

backup-list:
	docker exec -it postgres /usr/local/bin/list-backups
