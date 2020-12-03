FROM jenkinsci/blueocean:latest

MAINTAINER awesome

# wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
# tar -zxvf apache-maven-3.6.3-bin.tar.gz

COPY apache-maven-3.6.3 /usr/share/maven
USER root
RUN apk add ansible --no-cache
USER jenkins

