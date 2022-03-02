
# 1. gen ca-key
mkdir ~/dockerca
cd ~/dockerca
openssl genrsa -aes256 -out ca-key.pem 4096


# 2. add info for ca
openssl req -new -x509 -days 3650 -key ca-key.pem -sha256 -out ca.pem

# 3. gen server-key
openssl genrsa -out server-key.pem 4096

# 4. gen public key with ca
openssl req -subj "/CN=<host/ip>" -sha256 -new -key server-key.pem -out server.csr

# 5. whitelist & server config
echo subjectAltName = IP:0.0.0.0 >> extfile.cnf
echo extendedKeyUsage = server >> extfile.cnf

# 6. gen ca
openssl x509 -req -days 3650 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem -extfile extfile.cnf

# 7. gen client key
openssl genrsa -out key.pem 4096
openssl req -subj '/CN=client' -new -key key.pem -out client.csr

# 8. client config
echo extendedKeyUsage = clientAuth > extfile-client.cnf

# 9. gen ca
openssl x509 -req -days 3650 -sha256 -in client.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out cert.pem -extfile extfile-client.cnf

# 10. use ca for docker
chmod 400 ./*
cp server-*.pem ca.pem /etc/docker/

vim /lib/systemd/system/docker.service

# ExecStart=/usr/bin/dockerd --tlsverify --tlscacert=/etc/docker/ca.pem --tlscert=/etc/docker/server-cert.pem --tlskey=/etc/docker/server-key.pem -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock

systemctl daemon-reload
systemctl start docker

# 11. client ca
sz -be ca-key.pem ca.pem cert.pem key.pem


