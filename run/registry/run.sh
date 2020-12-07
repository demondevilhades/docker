
docker run -itd -v /data/registry:/var/lib/registry -p 5000:5000 --restart=always --name registry registry:latest

cat >> /etc/docker/daemon.json << EOF
{
"registry-mirrors": ["https://b9pmyelo.mirror.aliyuncs.com"],
"insecure-registries": ["*.*.*.*:5000"]
}
EOF

# systemctl restart docker

# docker tag busybox:latest *.*.*.*:5000/busybox:latest
# docker push *.*.*.*:5000/busybox:latest 
