# Usage :
# Build : docker build -t node:resume .
# npm install : docker run --rm -it -v $(pwd):/var/www node:resume npm install
# for dev, build and serve statics : docker run --rm -it -v $(pwd):/var/www -p 8081:8080 node:resume npm start
# only build statics : docker run --rm -it -v $(pwd):/var/www node:resume npx eleventy --output=dist
# shell : docker run --rm -it -v $(pwd):/var/www -p 8081:8080 node:resume /bin/sh

FROM node:10-alpine

# Dependencies for some node modules (node-gyp)
RUN apk update && apk add python3 make g++

# Whatever the OS I often force this uid to my main user
USER 1000

# Working dir inside the container (you're supposed to -v hostdir:/var/www)
WORKDIR /var/www

# "npm start" will launch a webserver listening on 8080 (you still need to map it with -p localport:8080)
EXPOSE 8080
