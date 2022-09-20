#!/bin/bash

if [ ! -d "/var/www/html/wordpress" ]
then
	mkdir /var/www/html/wordpress
	mv /tmp/wp-config.php /var/www/html/wordpress/
	cd /var/www/html/wordpress
fi
tail -f /dev/null
