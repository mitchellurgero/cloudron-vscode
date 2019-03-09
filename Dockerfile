FROM cloudron/base:1.0.0

# Setup dir's and binary for code-server
ADD code-server /app/code/code-server
ADD start.sh /app/code/start.sh
RUN mkdir -p /app/data/workdir
RUN chmod +x /app/code/start.sh

# Fixes a read-only filesystem error.
# Since this is VSCode and not a standalone node/php/go app, this should be fine.
RUN mkdir -p /app/data/global
## For whatever reason, the full home dir symlink doesnt work if the folder exists, lets remove and link it :)
RUN rm -rf /home/cloudron
RUN ln -s /app/data/global /home/cloudron
RUN chown -R cloudron:cloudron /home/cloudron

# Set permissions
RUN chown -R cloudron:cloudron /app/data

# Run start script
CMD [ "/app/code/start.sh" ]
