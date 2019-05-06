FROM nginx:1.16-alpine

# Update and get rid of any standart configurations
RUN apk update && apk upgrade \
  && rm /etc/nginx/conf.d/*

# NGINX proxy configuration file
COPY config/proxy.conf /etc/nginx/conf.d/
