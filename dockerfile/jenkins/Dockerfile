FROM jenkins/jenkins:lts

MAINTAINER demondevilhades <demonhades@foxmail.com>

# env JENKINS_UC http://mirror.xmission.com/jenkins/updates/

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# docker build -t demondevilhades/jenkins:lts .
#

#export JENKINS_HOME=/home/jenkins/
#
#docker run -itd \
#--name jenkins-dev \
#--privileged=true \
#--env JAVA_OPTS=-Djava.awt.headless=true \
#-v $JENKINS_HOME:/var/jenkins_home \
#-e TZ=Asia/Shanghai \
#-p 8080:8080 \
#-p 50000:50000 \
#demondevilhades/jenkins:lts
#
#docker exec -it jenkins-dev cat /var/jenkins_home/secrets/initialAdminPassword
