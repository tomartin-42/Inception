FROM	debian:stable-20220801

ARG     DB_NAME MYSQL_ADMIN_USER MYSQL_ROOT_PASSWORD MYSQL_USER MYSQL_PASSWORD

RUN	mkdir -p /run/php

RUN	apt-get	update \
	&& apt-get install -y php \
	&& apt-get install -y php-fpm \
	&& apt-get install -y php-mysqli \
#	&& apt-get install -y wordpress \
	&& apt-get install -y wget

COPY	/tools/www.conf /etc/php/7.4/fpm/pool.d

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp


WORKDIR	/tmp/ 	

COPY	/tools/conf.sh /tmp/

COPY	/tools/wp-config.php /tmp/

COPY	/tools/conf.sh /tmp/

#RUN	wp core download --allow-root 

RUN	sed -i "s/database_name_here/$DB_NAME/g" /tmp/wp-config.php \
	&& sed -i "s/username_here/$MYSQL_USER/g" /tmp/wp-config.php \
	&& sed -i "s/password_here/$MYSQL_PASSWORD/g" /tmp/wp-config.php

#RUN	wp core install --url=tomartin.42.fr --title=Inception --admin_user=$MYSQL_USER --admin_password=$MYSQL_PASSWORD --admin_email=info@example.com --allow-root

#COPY	/tools/wp-config.php /usr/share/wordpress/

CMD	["./conf.sh", "$MYSQL_USER", "$MYSQL_PASSWORD"]

#ENTRYPOINT ["tail", "-f", "/dev/null"]
