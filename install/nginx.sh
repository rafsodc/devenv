#!/bin/bash
mkdir /etc/sslcert
chmod 0777 /var/www
openssl req -x509 -newkey rsa:4096 -nodes -out /etc/sslcert/server.crt -keyout /etc/sslcert/server.key -days 3650 -subj "/C=UK/O=localhost/OU=Domain Control Validated/CN=localhost"
wget -O /etc/nginx/sites-available/code-server https://raw.githubusercontent.com/rafsodc/devenv/main/config/nginx/code-server
ln -s /etc/nginx/sites-available/code-server /etc/nginx/sites-enabled/code-server
systemctl restart nginx
