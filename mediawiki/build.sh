#!/bin/bash
docker-compose build --pull --no-cache 
docker-compose kill
docker tag mediawiki_ha-mediawiki:latest deepak524/ha-mediawiki:latest
docker rmi mediawiki_ha-mediawiki:latest

