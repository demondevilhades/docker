docker run \
-it --rm --name haproxy-check \
-v /data/haproxy/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg \
haproxy \
-c -f /usr/local/etc/haproxy/haproxy.cfg
