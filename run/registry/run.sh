
docker run -itd -v /data/registry:/var/lib/registry -p 5000:5000 --restart=always --name registry registry:latest

cat >> /etc/docker/daemon.json << EOF
{
"registry-mirrors": ["https://b9pmyelo.mirror.aliyuncs.com"],
"insecure-registries": ["{ip}:5000"]
}
EOF

# systemctl restart docker

# docker tag busybox:latest {ip}:5000/busybox:latest
# docker push {ip}:5000/busybox:latest 

# curl -X GET http://{ip}:5000/v2/_catalog
# curl -X GET http://{ip}:5000/v2/busybox/tags/list
