FROM	debian:buster

ARG	DB_NAME MYSQL_ADMIN_USER MYSQL_ADMIN_PASSWORD MYSQL_USER MYSQL_PASSWORD

RUN	apt-get	update \
	&& apt-get install -y mariadb-server

COPY	/tools/wordpress_db.sql /

RUN	service mysql start; \
	mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"; \
	mysql ${DB_NAME} < wordpress_db.sql; \
	mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_ADMIN_USER}' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}'; GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ADMIN_USER}' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}'; CREATE USER IF NOT EXISTS '${MYSQL_USER}' IDENTIFIED BY '${MYSQL_PASSWORD}'; GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}' IDENTIFIED BY '${MYSQL_PASSWORD}'; SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ADMIN_PASSWORD}'); FLUSH PRIVILEGES;"

RUN	rm wordpress_db.sql

COPY	/tools/50-server.cnf etc/mysql/mariadb.conf.d/

CMD	["mysqld"]
