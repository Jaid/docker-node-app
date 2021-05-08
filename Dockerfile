# syntax=docker/dockerfile:1
FROM node:16-alpine
RUN npm install --global npm
RUN mkdir -p /opt/app
WORKDIR /opt/app
RUN adduser -S app
RUN chown -R app /opt/app