FROM	debian:buster

ARG     DB_NAME MYSQL_ADMIN_USER MYSQL_ADMIN_PASSWORD MYSQL_USER MYSQL_PASSWORD

RUN	mkdir -p /run/php

RUN	apt-get	update \
	&& apt-get install -y php \
	&& apt-get install -y php-fpm \
	&& apt-get install -y php-mysqli \
	&& apt-get install -y wget \
	&& apt-get install -y vim

COPY	/tools/www.conf /etc/php/7.3/fpm/pool.d

WORKDIR	/tmp/ 	

COPY	/tools/conf.sh /tmp/

RUN	wget https://wordpress.org/latest.tar.gz \
	&& tar -xzvf latest.tar.gz \
	&& rm latest.tar.gz

COPY	/tools/wp-config.php /tmp/wordpress/

RUN	sed -i "s/database_name_here/$DB_NAME/g" /tmp/wordpress/wp-config.php \
	&& sed -i "s/username_here/$MYSQL_USER/g" /tmp/wordpress/wp-config.php \
	&& sed -i "s/password_here/$MYSQL_PASSWORD/g" /tmp/wordpress/wp-config.php

#RUN	mv /tmp/wordpress /var/www/html/

ENTRYPOINT	["./conf.sh"]
