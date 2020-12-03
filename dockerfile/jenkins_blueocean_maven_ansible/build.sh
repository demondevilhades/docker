#!/bin/bash

# wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
# tar -zxvf apache-maven-3.6.3-bin.tar.gz
# sed -i '159i\    </mirror>' apache-maven-3.6.3/conf/settings.xml
# sed -i '159i\        <mirrorOf>central</mirrorOf>' apache-maven-3.6.3/conf/settings.xml
# sed -i '159i\        <url>https://maven.aliyun.com/repository/central</url>' apache-maven-3.6.3/conf/settings.xml
# sed -i '159i\        <name>aliyun maven</name>' apache-maven-3.6.3/conf/settings.xml
# sed -i '159i\        <id>alimaven</id>' apache-maven-3.6.3/conf/settings.xml
# sed -i '159i\    <mirror>' apache-maven-3.6.3/conf/settings.xml
# sed -i '55i\  <localRepository>/home/maven/repo</localRepository>' apache-maven-3.6.3/conf/settings.xml

docker build -t jenkinsci/blueocean-maven-ansible:latest .

