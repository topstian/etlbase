#!/bin/bash
source ./config/tasks.conf

echo "${OUTPUT_COLOR}Stopping containers"
docker-compose down --remove-orphans