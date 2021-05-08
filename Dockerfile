# syntax=docker/dockerfile:1
FROM node:16
RUN npm install --global npm
# WORKDIR automatically creates missing folders
WORKDIR /opt/app
# https://stackoverflow.com/a/42019654/15443125
VOLUME /opt/app
RUN useradd --create-home --shell /bin/bash app
RUN chown -R app /opt/app