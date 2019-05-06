FROM node:alpine

RUN apk update && apk upgrade \
  && apk add --no-cache libc6-compat \
  && apk add mariadb

COPY burst-netx /burst-netx

# Configuration files
RUN rm -rf /burst-netx/config/defaults.js
COPY config/defaults.js /burst-netx/config/defaults.js

WORKDIR /burst-netx
RUN npm install

ENTRYPOINT npm start
