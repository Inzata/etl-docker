#!/bin/bash

for directory in /var/etl/etc/httpd/conf.d /var/etl/www/html /var/etl/projects;
do
	if ! [ -d $directory ]; then
		mkdir -p $directory
		if ! [ -d $directory ]; then
			echo "ERROR: Failed to create the $directory"
			exit 2
		fi
	fi
done

# httpd

if ! [ -L /etc/httpd/conf.d ]; then
	if [ -e /etc/httpd/conf.d ]; then
		cp -f /etc/httpd/conf.d/* /var/etl/etc/httpd/conf.d/ && rm -fr /etc/httpd/conf.d/;
	fi
	cd /etc/httpd/
	ln -s /var/etl/etc/httpd/conf.d conf.d

	if ! [ -L /etc/httpd/conf.d ]; then
		echo "ERROR: Failed to create a link /etc/httpd/conf.d";
		exit 2;
	fi
fi

# html

if ! [ -L /var/www/html ]; then
	if [ -e /var/www/html ]; then
		cp -fr /var/www/html /var/etl/www/ && rm -fr /var/www/html/;
	fi
	cd /var/www
	ln -s /var/etl/www/html html

	if ! [ -L /var/www/html ]; then
		echo "ERROR: Failed to create a link /var/etl/www/html/";
		exit 2;
	fi
fi

# projects

if ! [ -L /var/data/etl ]; then
	if [ -e /var/data/etl ]; then
		echo "You need to move the data from /var/data/etl to /var/etl/projects manually"
		exit 2
	fi
	mkdir -p /var/data
	cd /var/data
	ln -s /var/etl/projects etl
fi

apachectl -k start

while true; do sleep 1000; done
