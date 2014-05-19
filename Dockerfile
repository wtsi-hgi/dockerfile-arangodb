# docker-version 0.6

from webwurst/ubuntu:saucy
maintainer "Joshua C. Randall" <jcrandall@alum.mit.edu>
run apt-get update && apt-get -y upgrade

# helper
run apt-get -y install curl bzip2 less vim

# arangodb
run echo 'deb http://www.arangodb.org/repositories/arangodb2/xUbuntu_13.10/ /' >> /etc/apt/sources.list.d/arangodb.list
run	curl http://www.arangodb.org/repositories/arangodb/xUbuntu_13.10/Release.key | apt-key add -
run apt-get update && apt-get -y install arangodb=2.0.0

add . /docker
run mkdir -p /docker/arangodb

workdir /docker
cmd ["arangod", "--javascript.dev-app-path", "/docker/arangodb", "/var/lib/arangodb"]
expose 8529
