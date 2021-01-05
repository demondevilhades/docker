docker run -itd \
--rm --name haproxy \
-p 8888:8888 \
-p 16443:16443 \
-v /etc/localtime:/etc/localtime:ro \
-v /data/haproxy/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg \
haproxy
