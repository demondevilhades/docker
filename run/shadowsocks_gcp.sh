
# https://console.cloud.google.com/compute/instances
# https://console.cloud.google.com/networking/firewalls/list
# https://console.cloud.google.com/compute/metadata/sshKeys

docker run  -itd --name ss -e PASSWORD=123 -p 1234:8388 -p 1234:8388/udp -d --restart always shadowsocks/shadowsocks-libev 

iptables -A INPUT -p tcp --dport 15432 -j ACCEPT 
iptables -A OUTPUT -p tcp --sport 15432 -j ACCEPT 
iptables -A INPUT -p udp --dport 15432 -j ACCEPT 
iptables -A OUTPUT -p udp --sport 15432 -j ACCEPT 

