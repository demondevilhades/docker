FROM jenkinsci/blueocean:latest

MAINTAINER awesome

COPY apache-maven-3.6.3 /usr/share/maven
USER root
RUN apk add ansible --no-cache
RUN apk add npm --no-cache
USER jenkins

