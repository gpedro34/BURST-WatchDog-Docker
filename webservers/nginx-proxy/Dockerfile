FROM nginx:1.16-alpine

# Update and get rid of any standart configurations
RUN apk update && apk upgrade \
  && rm /etc/nginx/conf.d/*

# NGINX proxy configuration file template
COPY config/* /etc/nginx/conf.d/
