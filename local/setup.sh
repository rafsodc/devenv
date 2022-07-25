#!/bin/bash
export $(echo $(cat /local/.env.local | sed 's/#.*//g'| xargs) | envsubst)

# Copy config files into directory
sudo rsync -a /local/private/ /var/www/

# Config git
git config --global user.name $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL

# Start docker
sudo docker-compose --env-file .env.local build
sudo docker-compose --env-file .env.local up -d

# Create console alias

echo "alias console='sudo docker-compose -f /var/www/sodc-api/docker-compose.yml exec php php bin/console'" >> /home/ubuntu/.bash_aliases
source ~/.bashrc

# Set up JWT
sudo docker-compose exec php php bin/console lexik:jwt:generate-keypair

# Set up database
sudo docker-compose exec php php bin/console app:install:devenv

sudo docker-compose down
