FROM mariadb

# ENV MYSQL_ROOT_PASSWORD=WatchDogRoot@BURSTAlliance
# ENV MYSQL_DATABASE=watchdog
# ENV MYSQL_USER=watchdog
# ENV MYSQL_PASSWORD=WatchDog@BURSTAlliance
# ENV TZ=Europe/London

RUN apt-get update && apt-get upgrade -y

COPY sql/* /docker-entrypoint-initdb.d/
