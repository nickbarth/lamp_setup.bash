#!/bin/bash

####
# Install and setup a LAMP server stack.
#
# USAGE: ./server_setup.sh
##

MYSQL_ROOT_PASSWD=$1

# Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Update and Install Dependencies
apt-get -y update
apt-get -y upgrade
DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 mysql-server php5 mysql-client php5-common php5-mysql php5-xmlrpc php5-cgi php5-curl php5-gd php5-cli php5-fpm php-apc php-pear php5-dev php5-imap php5-mcrypt libapache2-mod-php5 libxml2 ca-certificates curl 

mysql --host="localhost" --user="root" --execute="SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWD');"