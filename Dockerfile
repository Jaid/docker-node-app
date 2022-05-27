# syntax=docker/dockerfile:1

ARG nodeVersion=18.2

FROM node:$nodeVersion

ARG userName=app
ARG groupName=$userName
ARG userId=1000
ARG groupId=1000

# https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#environment-variables
ENV NPM_CONFIG_PREFIX=/home/$userName/.npm-global
ENV PATH=$PATH:/home/$userName/.npm-global/bin

# https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#non-root-user
RUN userdel -r node
RUN addgroup --gid $groupId $groupName
RUN adduser --disabled-password --gecos '' --uid $userId --gid $groupId --home /home/$userName --shell /bin/bash $userName

USER $userName

# Update npm to suppress warnings
RUN npm install --global npm

# npm globals
RUN npm install --global find-by-extension-cli package-field-cli

# WORKDIR automatically creates missing folders
WORKDIR /home/$userName/app

ENV NODE_ENV=production

# Pass ARGs to child image
ENV userName=$userName groupName=$groupName userId=$userId groupId=$groupId

# Reset user
USER root