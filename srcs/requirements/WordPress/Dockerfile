FROM	debian:stable-20220801

ARG     DB_NAME MYSQL_ADMIN_USER MYSQL_ROOT_PASSWORD MYSQL_USER MYSQL_PASSWORD

RUN	mkdir -p /run/php

RUN	apt-get	update \
	&& apt-get install -y php \
	&& apt-get install -y php-fpm \
	&& apt-get install -y php-mysqli \
	&& apt-get install -y wordpress \
	&& apt-get install -y wget

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY	/tools/wp-config.php /usr/share/wordpress/

RUN	sed -i "s/database_name_here/$DB_NAME/g" /usr/share/wordpress/wp-config.php \
	&& sed -i "s/username_here/$MYSQL_USER/g" /usr/share/wordpress/wp-config.php \
	&& sed -i "s/password_here/$MYSQL_PASSWORD/g" /usr/share/wordpress/wp-config.php

CMD	["mv", "/usr/share/wordpress", "/var/www/html/"]

#ENTRYPOINT ["tail", "-f", "/dev/null"]
