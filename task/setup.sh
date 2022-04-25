#!/bin/bash

while getopts "e:" arg; do
  case $arg in
    e) environment=$OPTARG;;
  esac
done

echo -e "Initializing setup"
echo -e "SSL Self-Signed certificates generator"
case $environment in
  'test') openssl req -nodes -newkey rsa:2048 -keyout gateway.key -out gateway.crt -subj "/C=CL/ST=Santiago/L=Santiago/O=etlbase/OU=etlbase/CN=localhost";;
  *) openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout gateway.key -out gateway.crt;;
esac