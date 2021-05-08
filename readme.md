# docker-node-app

On Docker Hub: https://hub.docker.com/repository/docker/jaidchen/node-app

## Usage

```Dockerfile
FROM jaidchen/node-app
```

## Example
```Dockerfile
# syntax=docker/dockerfile:1
FROM jaidchen/node-app
COPY . .
RUN chown -R app /opt/app
USER app
RUN npm install
RUN npx webpack
CMD [ "node", "dist/package/production/index.js" ]
```