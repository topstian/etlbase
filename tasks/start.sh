#!/bin/bash
source ./tasks/helpers/task_helper.sh

echo "${OUTPUT_COLOR}Generating session"
openssl rand -hex 16 > ./.session.key
echo "${OUTPUT_COLOR}Building image"
docker-compose build
echo "${OUTPUT_COLOR}Starting containers"
docker-compose up -d