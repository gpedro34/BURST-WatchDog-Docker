FROM redis

COPY config /configs/

RUN apt-get update && apt-get upgrade -y

ENTRYPOINT redis-server /configs/redis.conf
