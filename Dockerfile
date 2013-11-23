# docker-version 0.6

from webwurst/ubuntu:saucy
maintainer "Tobias Bradtke" <webwurst@gmail.com>
run apt-get update && apt-get -y upgrade

# helper
run apt-get -y install curl bzip2 less vim

# arangodb
run echo 'deb http://www.arangodb.org/repositories/arangodb/xUbuntu_12.04/ /' >> /etc/apt/sources.list.d/arangodb.list
run	curl http://www.arangodb.org/repositories/arangodb/xUbuntu_12.04/Release.key | apt-key add -

run apt-get update && apt-get -y install arangodb

cmd ["/usr/sbin/arangod", "-c", "/etc/arangodb/arangod.conf"]
expose 8529