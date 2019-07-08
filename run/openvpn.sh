
# to check 

OPENVPN_DATA=***/openvpndata 
OPENVPN_NAME=*** 
IP=*** 

mkdir $OPENVPN_DATA

# 1. gen config 
docker run --name openvpn-test --rm -it --log-driver=none -v $OPENVPN_DATA:/etc/openvpn kylemanna/openvpn /usr/local/bin/ovpn_genconfig -u udp://$IP 

# 2. gen private key 
docker run --name openvpn-test --rm -it --log-driver=none -v $OPENVPN_DATA:/etc/openvpn kylemanna/openvpn /usr/local/bin/ovpn_initpki 
#PEM password
#PEM password
#ignore
#PEM password

# 3. gen client key 
docker run --name openvpn-test --rm -it -v $OPENVPN_DATA:/etc/openvpn kylemanna/openvpn /usr/local/bin/easyrsa build-client-full $OPENVPN_NAME nopass 
#PEM password

# 4. export client config 
docker run --name openvpn-test --rm -it -v $OPENVPN_DATA:/etc/openvpn kylemanna/openvpn /usr/local/bin/ovpn_getclient $OPENVPN_NAME > $OPENVPN_DATA/$OPENVPN_NAME.ovpn 

# 5. run openvpn docker container 
docker run -itd --name openvpn-test --privileged -v $OPENVPN_DATA:/etc/openvpn -p 1194:1194 kylemanna/openvpn 
