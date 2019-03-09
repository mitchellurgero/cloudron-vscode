#!/bin/bash

set -eu

## Check for temp file (holds the authentication password for now until Cloudron allows env variables to be set via manifest file
if [ ! -f /app/data/temp ]; then
    echo "No temp file found, generating new one..."
    echo $(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1) > /app/data/temp
fi

pa=`cat /app/data/temp`

chown -R cloudron:cloudron /app/data

## Launch VSCode, set port, and password for authentication.
exec /usr/local/bin/gosu cloudron:cloudron /app/code/code-server /app/data/workdir --port=8000 --allow-http --data-dir=/app/data --password=$pa
