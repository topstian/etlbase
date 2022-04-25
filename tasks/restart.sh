#!/bin/bash
source ./config/tasks.conf

echo "${OUTPUT_COLOR}Restarting containers"
./tasks/stop.sh
./tasks/start.sh