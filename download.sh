#!/bin/bash

cd /app/code/
## Get Download URL from GH API
CODE_URL=$(curl -s https://api.github.com/repos/codercom/code-server/releases/latest | jq -r ".assets[] | select(.name | test(\"linux-x64\")) | .browser_download_url")

## Begin download process
wget $CODE_URL -O /app/code/codeserver.tar.gz -nv

if [ ! -f /app/code/codeserver.tar.gz  ]; then
    echo "File not found!"
    exit 1; # Exit script if the download failed.

fi

tar xvzf codeserver.tar.gz
cd code-server*
mv ./code-server /app/code/code-server
