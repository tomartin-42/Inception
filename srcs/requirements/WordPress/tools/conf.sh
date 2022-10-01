#!/bin/bash

mv /tmp/wordpress /var/www/html/
php-fpm7.3 --nodaemonize
