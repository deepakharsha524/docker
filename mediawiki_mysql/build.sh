#!/bin/bash
docker-compose build --pull --no-cache 
docker-compose kill
docker tag mediawiki_mysql_ha-mediawiki_mysql:latest deepak524/ha-mediawiki_mysql:latest
docker rmi mediawiki_mysql_ha-mediawiki_mysql:latest

