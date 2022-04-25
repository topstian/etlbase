#!/bin/bash
source ./config/tasks.conf

echo "${OUTPUT_COLOR}Generating Self-signed SSL Certificate"
openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout gateway.key -out gateway.crt