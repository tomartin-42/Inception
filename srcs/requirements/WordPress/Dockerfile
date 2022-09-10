FROM	debian:stable-20220801

RUN	apt-get	update \
	&& apt-get install -y wordpress \
	&& apt-get install -y wget

RUN	mkdir -p /run/php

COPY	/tools/wp-config.php /tmp/

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY	/tools/configure.sh .

CMD	["./configure.sh"]
