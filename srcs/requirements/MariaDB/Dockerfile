FROM	debian:stable-20220801

RUN	apt-get	update \
	&& apt-get install -y mariadb-server

RUN	service mariadb start; \
	mysql -e \
	"CREATE DATABASE IF NOT EXISTS ${DB_NAME}; \
	CREATE USER IF NOT EXISTS '${MYSQL_ADMIN_USER}' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; \
	GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ADMIN_USER}' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}; \
	CREATE USER IF NOT EXISTS '${MYSQL_USER}' IDENTIFIED BY '${MYSQL_PASSWORD}'; \
	GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}' IDENTIFIED BY '${MYSQL_PASSWORD}'; \
	FLUSH PRIVILEGES";

COPY	/tools/50-server.cnf etc/mysql/mariadb.conf.d/

COPY	/tools/configure.sh .

CMD	["/bin/sh"]
#CMD	["mariadb"]
