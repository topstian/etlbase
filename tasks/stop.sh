#!/bin/bash
source ./tasks/helpers/task_helper.sh

echo "${OUTPUT_COLOR}Stopping containers"
docker-compose down --remove-orphans