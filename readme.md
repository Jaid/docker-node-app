# docker-node-app

[![dockeri.co](https://dockeri.co/image/jaidchen/node-app)](https://hub.docker.com/r/jaidchen/node-app)

## Usage

```Dockerfile
FROM jaidchen/node-app
```

## Example
```Dockerfile
# syntax=docker/dockerfile:1
FROM jaidchen/node-app
COPY . .
RUN chown --recursive $userName .
USER $userName
ARG nodeEnv=production
RUN mkdir --parents /home/$userName/.config/$(package-field-cli name)
RUN NODE_ENV=development npm install
RUN NODE_ENV=$nodeEnv node_modules/.bin/webpack
CMD NODE_ENV=$nodeEnv node dist/package/production/index.js
VOLUME /home/$userName/.config/$(package-field-cli name)
```