
openssl x509 -in ca.crt -noout -text

kubeadm alpha certs check-expiration

kubeadm alpha certs renew all
