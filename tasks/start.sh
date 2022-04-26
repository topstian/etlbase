#!/bin/bash
source ./tasks/helpers/task_helper.sh

echo "${OUTPUT_COLOR}Building image"
docker-compose build
echo "${OUTPUT_COLOR}Starting containers"
docker-compose up -d