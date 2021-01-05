
######### 1. set 192.168.102.200:16443 to <master:X>:6443 lb  

######### 2. k8s master1

kubeadm init \
--apiserver-advertise-address=192.168.102.200 \
--image-repository registry.aliyuncs.com/google_containers \
--control-plane-endpoint=192.168.102.200:16443 \
--kubernetes-version v1.17.14 \
--service-cidr=10.96.0.0/12 \
--pod-network-cidr=10.244.0.0/16 \
--upload-certs

######### 3. k8s master join

kubeadm join 192.168.102.200:16443 --token *** \
--discovery-token-ca-cert-hash sha256:*** \
--control-plane --certificate-key ***

######### 4. handle error

# network: failed to set bridge addr: "cni0" already has an IP address different from

# ifconfig cni0 down
# ip link delete cni0
