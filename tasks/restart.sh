#!/bin/bash
source ./tasks/helpers/task_helper.sh

echo "${OUTPUT_COLOR}Restarting containers"
./tasks/stop.sh
./tasks/start.sh