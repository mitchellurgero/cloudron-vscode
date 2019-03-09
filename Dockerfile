FROM cloudron/base:1.0.0

# Setup dir's and binary for code-server
ADD code-server /app/code/code-server
ADD start.sh /app/code/start.sh
RUN mkdir -p /app/data/workdir
RUN chmod +x /app/code/start.sh

# Setup NodeJS default dir to something else since we are in a read-only FS.
# Fixes a read-only filesystem error.
# Since this is VSCode and not a standalone node app, this should be fine.
RUN mkdir -p /app/data/global
RUN mkdir -p /app/data/global/.npm
RUN mkdir -p /app/data/global/.config
RUN mkdir -p /app/data/global/.npm-gyp
RUN ln -s /app/data/global/.npm /root/.npm
RUN ln -s /app/data/global/.npm-gyp /root/.npm-gyp
RUN ln -s /app/data/global/.config /root/.config

# Set permissions
RUN chown -R cloudron:cloudron /app/data

# Run start script
CMD [ "/app/code/start.sh" ]
