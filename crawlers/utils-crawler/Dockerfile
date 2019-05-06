FROM node:alpine

# ENV WORKERS=10
# ENV BRS_USER_AGENT=BRS/9.9.9
# ENV BRS_TIMEOUT=10000
# ENV RESCAN_INTERVAL=15
# ENV DB_HOST=mariadb
# ENV DB_PORT=3306
# ENV DB_USER=watchdog
# ENV DB_PASS=WatchDog@BURSTAlliance
# ENV DB_NAME=watchdog

RUN apk update && apk upgrade \
  && apk add --no-cache libc6-compat \
  && apk add mariadb

COPY utils-crawler /utils-crawler

# Configuration files
RUN rm -rf /utils-crawler/config/defaults.js
COPY config/defaults.js /utils-crawler/config/defaults.js

WORKDIR /utils-crawler
RUN npm install

ENTRYPOINT npm start
