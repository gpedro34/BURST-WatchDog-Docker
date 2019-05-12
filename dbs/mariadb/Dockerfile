FROM mariadb

RUN apt-get update && apt-get upgrade -y

COPY sql/* /docker-entrypoint-initdb.d/
