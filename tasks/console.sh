#!/bin/bash
source ./tasks/helpers/task_helper.sh

echo "${OUTPUT_COLOR}Running pry"
docker-compose exec backend bundle exec pry -r ./config/initializers/main