# syntax=docker/dockerfile:1

ARG nodeVersion=18.9.0
ARG baseFlavor=bullseye-slim

FROM node:$nodeVersion-$baseFlavor

ARG userName=app
ARG groupName=$userName
ARG userId=1000
ARG groupId=1000
ARG userHome=/$userName

# https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#environment-variables
ENV NPM_CONFIG_PREFIX=/$userHome/.npm-global
ENV PATH=$PATH:/$userHome/.npm-global/bin

# https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#non-root-user
RUN userdel -r node
RUN addgroup --gid $groupId $groupName
RUN adduser --disabled-password --gecos '' --uid $userId --gid $groupId --home $userHome --no-create-home --shell /bin/bash $userName
RUN mkdir --parents $userHome

# Update npm to suppress warnings
RUN npm install --global npm

# WORKDIR automatically creates missing folders
WORKDIR $userHome

ENV NODE_ENV=production

# Pass ARGs to child image
ENV userName=$userName groupName=$groupName userId=$userId groupId=$groupId userHome=$userHome