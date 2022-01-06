#!/bin/bash

echo -e "[ETLBASE] Initializing setup"
echo -e "[ETLBASE] SSL Self-Signed certificates generator"
openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout gateway.key -out gateway.crt