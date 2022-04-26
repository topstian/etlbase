#!/bin/bash
source ./tasks/helpers/task_helper.sh

echo "${OUTPUT_COLOR}Building image"
docker-compose build
echo "${OUTPUT_COLOR}Running tests"
docker-compose run backend bundle exec rspec