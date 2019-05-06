FROM nginx:1.16-alpine

RUN apk update && apk upgrade

# Static files to display
COPY burst-netx-ui /usr/share/nginx/html

# Configuration files
RUN rm -rf /usr/share/nginx/html/burst-netx-ui/configs.js
COPY config/configs.js /usr/share/nginx/html/burst-netx-ui/configs.js
