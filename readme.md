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
RUN NODE_ENV=development npm install
RUN node_modules/.bin/webpack
CMD ["/bin/bash", "-c", "node $(find-by-extension-cli js --fullPath --cwd dist/package/production)"]
```