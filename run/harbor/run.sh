
0.
# docker : https://docs.docker.com/engine/install/
# docker-compose : https://docs.docker.com/compose/install/

1. 
wget https://github.com/goharbor/harbor/releases/download/v2.4.0/harbor-offline-installer-v2.4.0.tgz
tar -zxvf harbor-offline-installer-v2.4.0.tgz

cp harbor.yml.tmpl harbor.yml

vim harbor.yml

2. 
./prepare

3. 
sudo ./install
