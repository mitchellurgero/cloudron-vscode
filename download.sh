#!/bin/bash

cd /app/code/

## Put download URL here
wget https://github.com/cdr/code-server/releases/download/1.1156-vsc1.33.1/code-server1.1156-vsc1.33.1-linux-x64.tar.gz -O /app/code/codeserver.tar.gz -nv

if [ ! -f /app/code/codeserver.tar.gz  ]; then
    echo "File not found!"
    exit 1; # Exit script if the download failed.

fi

tar xvzf codeserver.tar.gz
cd code-server*
mv ./code-server /app/code/code-server
