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
RUN chown -R app /opt/app
USER app
RUN npm install
RUN npx webpack
CMD [ "node", "dist/package/production/index.js" ]
```