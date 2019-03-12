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

# Install Mono-Complete for .NET development
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt update
RUN apt install -y mono-complete

# Install PowerShell Core 6.1.3
RUN wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O /app/code/powershell.deb
RUN dpkg -i /app/code/powershell.deb
RUN apt update
RUN apt install -y powershell


# Set permissions
RUN chown -R cloudron:cloudron /app/data

# Run start script
CMD [ "/app/code/start.sh" ]
