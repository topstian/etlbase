#!/bin/bash
source ./config/tasks.conf

STAGE="development"

while getopts "env:" arg; do
  case $arg in
    e) STAGE=$OPTARG;;
  esac
done

export $(xargs < .env.${STAGE})