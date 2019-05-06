# Usage

1.  Download all necesary files

```
git clone https://github.com/gpedro34/burst-watchdog-docker
./script/install.sh
```

2.  Modify docker-compose.yml ENV variables or each repository configuration files
3.  Place DB dumps or any initial SQL scripts inside /mariadb/sql. Files are read in alphabetic order (use initial numbers in the file name to ensure you control mariadb sync workflow). Accepted file extensions:

-   .SQL
-   .SH
-   .SQL.GZ

4.  Build and launch

```
./script/launcher.sh
```
