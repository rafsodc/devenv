#!/bin/bash


# Start docker
sudo docker-compose --env-file .env.local build
sudo docker-compose --env-file .env.local up -d

# Start message consumer
sudo docker-compose -f /var/www/sodc-api/docker-compose.yml exec php php bin/console messenger:consume -vv

