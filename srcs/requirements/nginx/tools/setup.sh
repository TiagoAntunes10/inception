#!/bin/bash

mkdir -p /etc/nginx/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx-selfsigned.key \
	-out /etc/nginx/ssl/inception.crt \
	-subj "/C=MO/ST=KH/O=42/OU=42/CN=${INCEPTION_LOGIN}.42.fr"

echo "
server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name ${INCEPTION_LOGIN}.42.fr;

    ssl_certificate /etc/nginx/ssl/inception.crt;
    ssl_certificate_key /etc/nginx/ssl/nginx-selfsigned.key;

    ssl_protocols TLSv1.3;

    index index.php;
    root /var/www/html;

	location / {
	}

	try_files $uri $uri/ =404;

    location ~ \.php$ { 
            include snippets/fastcgi-php.conf;
			fastcgi_pass wordpress:9000;
        }
}" >  /etc/nginx/sites-available/default

nginx -g "daemon off;"
