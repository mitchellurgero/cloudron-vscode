FROM cloudron/base:1.0.0@sha256:147a648a068a2e746644746bbfb42eb7a50d682437cead3c67c933c546357617

# Setup dir's and binary for code-server
ADD start.sh /app/code/start.sh
ADD download.sh /app/code/download.sh
RUN mkdir -p /app/data/workdir
RUN chmod +x /app/code/start.sh
RUN chmod +x /app/code/download.sh


# Install Basic Dependencies
RUN apt update
RUN apt install jq apt-transport-https -y
#RUN a2enmod proxy*
#RUN a2enmod rewrite mime ldap authnz_ldap headers
#ADD site.conf /etc/apache2/sites-available/site.conf
#ADD ports.conf /etc/apache2/ports.conf
#RUN a2ensite site
#RUN a2dissite 000-default
# Fixes a read-only filesystem error.
# Since this is VSCode and not a standalone node/php/go app, this should be fine.
RUN mkdir -p /app/data/global
## For whatever reason, the full home dir symlink doesnt work if the folder exists, lets remove and link it :)
RUN rm -rf /home/cloudron
RUN ln -s /app/data/global /home/cloudron
RUN chown -R cloudron:cloudron /home/cloudron

# Run download script for any stuff we need that is not available in the ubuntu repos (like the code-server pacakges)
RUN /bin/bash /app/code/download.sh

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
RUN apt-get install dotnet-sdk-2.2 -y

# Set permissions
RUN chown -R cloudron:cloudron /app/data
RUN npm install -g cloudron

EXPOSE 8001

# Run start script
CMD [ "/app/code/start.sh" ]
