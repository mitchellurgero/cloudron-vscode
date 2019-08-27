#!/bin/bash

set -eu

## Make sure permissions are good to go!
chown -R cloudron:cloudron /app/data
cd /app/data

## Launch VSCode, set port, and password for authentication.
APACHE_CONFDIR="" source /etc/apache2/envvars
rm -f "${APACHE_PID_FILE}"
exec /usr/sbin/apache2 -DFOREGROUND &

exec /usr/local/bin/gosu cloudron:cloudron /app/code/code-server /app/data/workdir --port=8000 --allow-http --data-dir=/app/data --trust-proxy --no-auth