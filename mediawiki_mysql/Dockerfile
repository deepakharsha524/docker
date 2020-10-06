FROM mariadb

ENV MYSQL_ROOT_PASSWORD="CHANGEME" MYSQL_DATABASE="wikidatabase" MYSQL_USER="wiki" MYSQL_PASSWORD="CHANGEME"
EXPOSE 3306

ADD setup.sql /docker-entrypoint-initdb.d





