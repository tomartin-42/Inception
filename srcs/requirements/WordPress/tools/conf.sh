#!/bin/bash

if [ ! -d "/var/www/html/wordpress" ]
then
	mkdir /var/www/html/wordpress
	cd /var/www/html/wordpress
	wp core download --allow-root
	mv /tmp/wp-config.php /var/www/html/wordpress/
	wp core install --url=tomartin.42.fr --title=Inception \
	--admin_user=$1 --admin_password=$2 --admin_email=info@example.com --allow-root
fi
exec php-fpm7.4 --nodaemonize
#tail -f /dev/null
