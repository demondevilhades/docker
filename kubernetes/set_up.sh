
# just for centos7

######### 1
# disable firewall

systemctl stop firewalld
systemctl disable firewalld


# disable selinux

sestatus -v
getenforce

sed -i 's/enforcing/disabled/' /etc/selinux/config
setenforce 0

# set hostname

hostnamectl set-hostname <hostname>

# add hosts to master

vim /etc/sysconfig/network-scripts/ifcfg-ens33

cat >> /etc/hosts << EOF
192.168.102.200 k8s-master
192.168.102.201 k8s-node1
192.168.102.202 k8s-node2
EOF

# put stream of ipv4 to iptables

cat >> /etc/sysctl.d/k8s.config << EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system

# sync datetime

yum install ntpdate -y
ntpdate time.windows.com

cp /usr/share/zoneinfo/Asia/Shanghai /ect/localtime

######### 2. disable swap

free -h

swapoff -a

sed -ri 's/.*swap.*/#&/' /etc/fstab

vim /etc/fstab

######### 3. install docker

wget https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo -O /etc/yum.repos.d/docker-ce.repo

ll /etc/yum.repos.d/docker-ce.repo

yum -y install docker-ce-18.06.1.ce-3.el7

systemctl enable docker && systemctl start docker

docker -version

cat >> /etc/docker/daemon.json << EOF
{
	"registry-mirrors": ["https://b9pmyelo.mirror.aliyuncs.com"],
	"exec-opts": ["native.cgroupdriver=systemd"],
	"log-driver": "json-file",
	"log-opts": {
		"max-size": "100m"
	},
	"storage-driver": "overlay2"
}
EOF


######### 4. install kubeadm & kubelet & kubectl

cat >> /etc/yum.repos.d/kubernetes.repo << EOF
[kubernetes]
name=Kubernetes
baseurl=http://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=http://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg
http://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF


yum install -y kubelet-1.17.0 kubeadm-1.17.0 kubectl-1.17.0
systemctl enable kubelet


######### 5. k8s master

# echo "1" >/proc/sys/net/bridge/bridge-nf-call-iptables

kubeadm init \
--apiserver-advertise-address=192.168.102.200 \
--image-repository registry.aliyuncs.com/google_containers \
--kubernetes-version v1.17.0 \
--service-cidr=10.96.0.0/12 \
--pod-network-cidr=10.244.0.0/16 

# kubectl

# mkdir -p $HOME/.kube
# sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
# sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl get nodes

kubectl get pods -n kube-system

######### 6. Pod (cni)

# kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

wget https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

vim kube-flannel.yml

# image: quay.io/coreos/flannel:v0.12.0-amd64 -> image: demondevilhades/coreos.flannel:v0.12.0-amd64

# https://github.com/coreos/flannel/releases

# ssh root@k8s-master 'docker save quay.io/coreos/flannel:v0.12.0-amd64' | docker load

kubectl apply -f kube-flannel.yml

# kubectl describe pos <POD NAME> -n kube-system

######### 7. kubernetes nodes join

# kubeadm join 192.168.102.200:6443 --token sawty5.9i4we3bnucs2mu0w \
#   --discovery-token-ca-cert-hash sha256:a379bab1a5d61c31c12979693fcd52f9e5d0253ca5ef3cceea44fb53e7d5bef3 

######### 8. test

kubectl create deployment nginx --image=nginx

kubectl expose deployment nginx --port=80 --type=NodePort

kubectl get pod,svc

# http://<NodeIP>:<Port>

######### 9. deploy Dashboard

kubectl apply -f http://raw.githubusercontent.com/kubernetes/dashboard/v2.0.3/aio/deploy/recommended.yaml

# kubectl get pods -n kubernetes-dashboard

# https://github.com/kubernetes/dashboard/blob/master/aio/deploy/recommended.yaml

# vim recommended.yaml

# http://<NodeIP>:30001

kubectl create serviceaccount dashboard-admin -n kube-system
kubectl create clusterrolebinding dashboard-admin --clusterrole=cluster-admin --serviceaccount=kube-system:dashboard-admin
kubectl describe secrets -n kube-system $(kubectl -n kube-system get secret | awk '/dashboard-admin/{print $1}')

# token: eyJhbGciOiJSUzI1NiIsImtpZCI6Im85VU54RkdpQklaV0E2ZHFhams0NG1NbmV2S18xMFF0R2pHdVBXSXRxOHcifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJkYXNoYm9hcmQtYWRtaW4tdG9rZW4tcXZiY2oiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGFzaGJvYXJkLWFkbWluIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQudWlkIjoiYTg4NDkyNWItZjUyZC00ODMzLTk0MjktNjQxODUyZWY4MTQzIiwic3ViIjoic3lzdGVtOnNlcnZpY2VhY2NvdW50Omt1YmUtc3lzdGVtOmRhc2hib2FyZC1hZG1pbiJ9.e3JX1Wy6Wh_3_FaTigVWH0tGB2chPBn2ydw5R84eBDlm-N3so5366UMYgummT8UjeSEHylKZ8x0nDj4-no1JKVXOyhyvFjYx1G0jTo53hnEx14yxvI1-ZpTfei-2sycNft2jqhqEDooQ7Yp5TDFoe7NnWDStdWQC-vuWTvp9cfyLCMrkPllD-upsjYujSdPNzS5VSorrGPyu90Znu2TnyACYQqrl_nhJps9LkKMmvHaLU_FrRtvi9BAUoYRPx-S6WQG2A7GI-Wd0s7C-A0hgZ5369rzNlsZFAJ_ZxRtflUCH3CYOk7GILSV1_LtM4rpWA5pe9f9eKqP-NZc-ZFIh8g



#################################################################################

# deployment

kubectl create deployment <APP NAME> --image=<IMAGE NAME> --dry-run -o yaml > deploy.yaml

kubectl apply -f deploy.yaml

kubectl get pods

kubectl logs <POD NAME>

kubectl expose deployment <APP NAME> --port=80 --target-port=8080 --type=NodePort --dry-run -o yaml > svc.yaml


#################################################################################

# docker images trans

docker info

docker load --input <image.docker>

docker save <IMAGE ID> | docker load

docker tag <IMAGE ID> <REPOSITORY>:<TAG>

docker push <REPOSITORY>:<TAG>

ssh root@ip 'docker save <REPOSITORY>:<TAG>'|docker load

