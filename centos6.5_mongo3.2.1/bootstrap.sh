#!/usr/bin/env bash

# Install htop
yum install -y htop

# Instal MongoDB
cat >/etc/yum.repos.d/mongodb-org-3.2.repo <<EOL
[mongodb-org-3.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/6Server/mongodb-org/3.2/x86_64/
gpgcheck=0
enabled=1
EOL

DB_VER=3.2.1
yum install -y mongodb-org-$DB_VER mongodb-org-server-$DB_VER mongodb-org-shell-$DB_VER mongodb-org-mongos-$DB_VER mongodb-org-tools-$DB_VER

# Start MongoDB
service mongod restart
chkconfig mongod on


# Install NPM & Upgrade NodeJs
yum install -y npm
npm cache clean -f
npm install -g n
n stable

# Install MongoDB monitoring tool
npm install -g mongo-express
mongo-express -u superuser -p password
