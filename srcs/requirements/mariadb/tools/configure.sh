#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ -d /var/lib/mysql/mysql ]; then
	echo "[i] MySQL directory already present, skipping creation"
else
	echo "[i] MySQL data directory not found, creating initial DBs"

	chown -R mysql:mysql /var/lib/mysql

	# init database
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null
	echo '[i] Database initialized'

	echo "[i] MySql root password: $MYSQL_ROOT_PWD"

	tfile=`mktemp`
	if [ ! -f "$tfile" ]; then
		return 1
	fi

	cat << EOF > $tfile
USE mysql;
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $WP_DATABASE_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$WP_DATABASE_USR'@'%' IDENTIFIED BY '$WP_DATABASE_PWD';
GRANT ALL PRIVILEGES ON *.* TO '$WP_DATABASE_USR'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD';
EOF

	# run sql in tempfile
	echo "[i] Executing queries: $tfile"
	/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 < $tfile
	rm -f $tfile
fi

# allow remote connections
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/my.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

echo "[i] Starting mariadb server"
exec /usr/bin/mysqld --user=mysql --console