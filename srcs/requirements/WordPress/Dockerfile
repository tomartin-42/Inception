FROM	debian:stable-20220801

ARG     DB_NAME MYSQL_ADMIN_USER MYSQL_ROOT_PASSWORD MYSQL_USER MYSQL_PASSWORD

RUN	mkdir -p /run/php

RUN	apt-get	update \
	&& apt-get install -y php \
	&& apt-get install -y wordpress \
	&& apt-get install -y wget

COPY	/tools/wp-config.php /tmp/

#RUN	sed -i "s/Database_name/$DB_NAME/g" /usr/share/webapps/wordpress/wp-config.php \
#	&& sed -i "s/Database_user/$MYSQL_USER/g" /usr/share/webapps/wordpress/wp-config.php \
#	&& sed -i "s/Database_password/$MYSQL_PASSWORD/g" /usr/share/webapps/wordpress/wp-config.php
#RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

#COPY	/tools/configure.sh .

ENTRYPOINT ["tail", "-f", "/dev/null"]
#CMD	["./configure.sh"]
