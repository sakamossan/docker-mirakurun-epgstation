#!/bin/sh

git clone https://github.com/sakamossan/docker-mirakurun-epgstation.git
cd docker-mirakurun-epgstation
docker compose run --rm -e SETUP=true mirakurun
# https://blog.n-t.jp/post/tech/resolve-EPGStation-update-programs-error/
docker compose run --rm --user root mysql /usr/bin/mysql -uroot -pepgstation epgstation \
    -e "DROP DATABASE IF EXISTS epgstation; CREATE DATABASE epgstation CHARACTER SET utf8mb4;"
