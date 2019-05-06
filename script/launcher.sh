#!/usr/bin/env bash

docker-compose build \
  && docker-compose up -d \
  && docker-compose start wait \
  && docker-compose restart brs-crawler \
  && docker-compose restart utils-crawler \
  && echo "Everything is up and running!"
