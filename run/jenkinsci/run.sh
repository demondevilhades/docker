
mkdir /data/jenkins_blueocean/data
mkdir /data/jenkins_blueocean/home

chown -R 1000:1000 /data/jenkins_blueocean/data
chown -R 1000:1000 /data/jenkins_blueocean/home

echo "Asia/Hong_Kong" > /etc/timezone

docker-compose up -d
