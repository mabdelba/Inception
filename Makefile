all:
	@docker compose -f ./srcs/docker-compose.yml up

dir:
	@mkdir /home/mabdelba/data/wordpress /home/mabdelba/data/db
	
d:
	@docker compose -f ./srcs/docker-compose.yml up -d

build:
	@docker compose -f ./srcs/docker-compose.yml up --build

build-d:
	@docker compose -f ./srcs/docker-compose.yml up --build -d

clean:
	@docker compose -f ./srcs/docker-compose.yml down

fclean: clean
	@docker volume rm srcs_wordpress-volume srcs_mariadb-volume
	@sudo rm -rf /home/mabdelba/data/db /home/mabdelba/data/wordpress

