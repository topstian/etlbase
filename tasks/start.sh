#!/bin/bash
source ./config/tasks.conf

echo "${OUTPUT_COLOR}Building image"
docker-compose build
echo "${OUTPUT_COLOR}Starting containers"
docker-compose up -d