#!/bin/bash

set -eu

## Make sure permissions are good to go!
chown -R cloudron:cloudron /app/data

## Launch VSCode, set port, and password for authentication.
exec /usr/local/bin/gosu cloudron:cloudron /app/code/code-server /app/data/workdir --port=8000 --allow-http --data-dir=/app/data --trust-proxy --no-auth