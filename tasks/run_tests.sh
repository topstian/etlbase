#!/bin/bash
source ./config/tasks.conf

echo "${OUTPUT_COLOR}Building image"
docker-compose build
echo "${OUTPUT_COLOR}Running tests"
docker-compose run backend bundle exec rspec