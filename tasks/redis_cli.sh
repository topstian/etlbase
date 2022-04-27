#!/bin/bash
source ./tasks/helpers/task_helper.sh

echo "${OUTPUT_COLOR}Running redis-cli"
docker-compose exec hidata redis-cli