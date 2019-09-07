FROM jenkins/jenkins:lts

MAINTAINER demondevilhades <demonhades@foxmail.com>

# env JENKINS_UC http://mirror.xmission.com/jenkins/updates/

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# docker build -t demondevilhades/jenkins:lts .
#
