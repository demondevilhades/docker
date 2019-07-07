
# curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

apt-get update 
apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl software-properties-common 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - 
# curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | apt-key add - 
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" 
# add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable" 
apt-get update 

apt-get install -y --no-install-recommends docker-ce 

