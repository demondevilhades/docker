# docker

######### images

docker pull tensorflow/tensorflow:1.13.1-py3

docker pull ubuntu:18.04

docker commit -a "awesome" *** REPOSITORY:TAG

docker save -o ***.tar REPOSITORY:TAG

ssh root@ip 'docker save REPOSITORY:TAG'|docker load
