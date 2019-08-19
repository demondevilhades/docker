
apt-get update 
apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl software-properties-common 

# curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/debian/gpg | sudo apt-key add - 
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - 

# add-apt-repository  "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/debian  $(lsb_release -cs) stable" 
add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/debian  $(lsb_release -cs)  stable" 

apt-get update 

apt-get install -y --no-install-recommends docker-ce 

systemctl enable docker 
systemctl start docker 
