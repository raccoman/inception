#!/bin/sh

# wait for db
while ! mariadb -h$MYSQL_HOST -u$WP_DATABASE_USR -p$WP_DATABASE_PWD $WP_DATABASE_NAME &>/dev/null; do
    sleep 3
done

if [ ! -f "/var/www/html/wordpress/index.php" ]; then

    mv /tmp/wp-config.php /var/www/html/wordpress/wp-config.php

    wp core download
    wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email
    wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD
    wp theme install inspiro --activate
    wp plugin update --all
fi

echo "Wordpress listesting on :9000"
/usr/sbin/php-fpm7 -F -R