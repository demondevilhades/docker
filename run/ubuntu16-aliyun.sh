
docker run -itd \
--name ubuntu-test \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/timezone:/etc/timezone:ro \
-v /etc/apt/sources.list:/etc/apt/sources.list:ro \
-v /data/common:/data/common \
-p 10001:22 \
-p 80:80 \
-p 443:443 \
ubuntu:16.04
