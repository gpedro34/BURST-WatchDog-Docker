# DB Dumps come to this folder

## To make a DB dump run:
```
docker exec burst-watchdog-docker-mariadb sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > ./data/backup/mariadb/db-dump.sql
```
