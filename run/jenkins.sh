
docker run -itd \
--name jenkins-dev \
--env JAVA_OPTS=-Djava.awt.headless=true \
-v ***\jenkins_home:/var/jenkins_home \
-e TZ=Asia/Shanghai \
-p 8080:8080 \
-p 50000:50000 \
jenkins:latest 

docker exec -it jenkins-dev cat /var/jenkins_home/secrets/initialAdminPassword
