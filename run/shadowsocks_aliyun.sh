
docker run  -itd --name ss -e PASSWORD=zs654321 -p 8388:8388 -p 8388:8388/udp -d --restart always shadowsocks/shadowsocks-libev

# 
# wget http://update.aegis.aliyun.com/download/quartz_uninstall.sh
# chmod x quartz_uninstall.sh
# ./quartz_uninstall.sh
# 
# rm -rf /etc/init.d/agentwatch /usr/sbin/aliyun-service
# rm -rf /usr/local/aegis*
# 
# iptables -I INPUT -s 140.205.201.0/28 -j DROP
# iptables -I INPUT -s 140.205.201.16/29 -j DROP
# iptables -I INPUT -s 140.205.201.32/28 -j DROP
# iptables -I INPUT -s 140.205.225.192/29 -j DROP
# iptables -I INPUT -s 140.205.225.200/30 -j DROP
# iptables -I INPUT -s 140.205.225.184/29 -j DROP
# iptables -I INPUT -s 140.205.225.183/32 -j DROP
# iptables -I INPUT -s 140.205.225.206/32 -j DROP
# iptables -I INPUT -s 140.205.225.205/32 -j DROP
# iptables -I INPUT -s 140.205.225.195/32 -j DROP
# iptables -I INPUT -s 140.205.225.204/32 -j DROP
# 
# iptables -A INPUT -p tcp --dport 8388 -j ACCEPT
# iptables -A OUTPUT -p tcp --sport 8388 -j ACCEPT
# iptables -A INPUT -p udp --dport 8388 -j ACCEPT
# iptables -A OUTPUT -p udp --sport 8388 -j ACCEPT
