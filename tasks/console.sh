#!/bin/bash
source ./tasks/helpers/task_helper.sh

echo "${OUTPUT_COLOR}Building image"
docker-compose build
echo "${OUTPUT_COLOR}Running pry"
docker-compose run backend bundle exec pry -r ./config/initializers/main