
export JENKINS_HOME=/home/jenkins/
export MAVEN_HOME=/opt/apache-maven-3.6.1
export MAVEN_REPOSITORY=/data/maven
export PATH=$MAVEN_HOME/bin:$PATH

docker run -itd \
--name jenkins-dev \
--privileged=true \
--env JAVA_OPTS=-Djava.awt.headless=true \
-v $JENKINS_HOME:/var/jenkins_home \
-v $MAVEN_HOME:/var/maven_home \
-v $MAVEN_REPOSITORY:/data/maven \
-e MAVEN_HOME=/var/maven_home \
-e MAVEN_REPOSITORY=$MAVEN_REPOSITORY \
-e TZ=Asia/Shanghai \
-p 8080:8080 \
-p 50000:50000 \
demondevilhades/jenkins:lts

docker exec -it jenkins-dev cat /var/jenkins_home/secrets/initialAdminPassword

# 0
# url: /user/admin/configure

# 1
# url: /pluginManager/advanced
# http://mirrors.jenkins-ci.org/status.html
# http://localhost:8080/pluginManager/advanced
# http://updates.jenkins.io/update-center.json
# http://mirror.xmission.com/jenkins/updates/update-center.json
# http://mirrors.shu.edu.cn/jenkins/updates/current/update-center.json
# https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/update-center.json
# http://mirror.esuni.jp/jenkins/updates/update-center.json

# 2
# url: /configureTools/
# /var/maven_home/conf/settings.xml

# 3
# configure
# GIT_SSL_NO_VERIF=1
# http_proxy=ip:port
# https_proxy=ip:port

# 4
# url: /credentials/store/system/domain/_/newCredentials

# 5
# 
# $MAVEN_HOME/bin/mvn

# 6
# scp
# kill -9 `jps | grep *** | awk '{print $1}'`
# nohup java -jar ***.jar > /dev/null 2>&1 &
# restart

# 7
# find ./ -mtime +7 -name '*' | xargs rm -rf
# 
