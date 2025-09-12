# Existing lines
FROM jenkins/jenkins:lts

USER root

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm

# Install Docker CLI
RUN apt-get update && apt-get install -y docker.io

USER jenkins
