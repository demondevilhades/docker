
mkdir $JENKINS_HOME/jenkins-install-plugins-shell
chmod 755 $JENKINS_HOME/jenkins-install-plugins-shell
cp ./install-plugins.sh $JENKINS_HOME/jenkins-install-plugins-shell/
cp ./plugins.txt $JENKINS_HOME/jenkins-install-plugins-shell/
cp ./jenkins-support $JENKINS_HOME/jenkins-install-plugins-shell/
cd $JENKINS_HOME/jenkins-install-plugins-shell
export JENKINS_WAR_PATH=$JENKINS_HOME/war/
./install-plugins.sh < plugins.txt

docker run -itd \
--name jenkins-dev \
--privileged=true \
--env JAVA_OPTS=-Djava.awt.headless=true \
-v $JENKINS_HOME:/var/jenkins_home \
-e TZ=Asia/Shanghai \
-p 8080:8080 \
-p 50000:50000 \
jenkins/jenkins:lts 

docker exec -it jenkins-dev cat /var/jenkins_home/secrets/initialAdminPassword

# http://mirrors.jenkins-ci.org/status.html
# http://localhost:8080/pluginManager/advanced
# http://updates.jenkins.io/update-center.json
# http://mirror.xmission.com/jenkins/updates/update-center.json
# http://mirrors.shu.edu.cn/jenkins/updates/current/update-center.json
# https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/update-center.json
# http://mirror.esuni.jp/jenkins/updates/update-center.json

# http://localhost:8080/pluginManager/available

