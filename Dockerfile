# syntax=docker/dockerfile:1
FROM node:16
RUN npm install --global npm
RUN mkdir -p /opt/app
WORKDIR /opt/app
RUN useradd --create-home --shell /bin/bash app
RUN chown -R app /opt/app