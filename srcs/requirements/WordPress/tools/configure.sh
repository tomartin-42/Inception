ed -i "s/Database_name/$DB_NAME/g" /usr/share/webapps/wordpress/wp-config.php
sed -i "s/Database_user/$DB_USER/g" /usr/share/webapps/wordpress/wp-config.php
sed -i "s/Database_password/$DB_USER_PASSWD/g" /usr/share/webapps/wordpress/wp-config.php
