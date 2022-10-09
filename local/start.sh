#!/bin/bash


# Start docker
sudo docker-compose --env-file .env.local build
sudo docker-compose --env-file .env.local up -d

