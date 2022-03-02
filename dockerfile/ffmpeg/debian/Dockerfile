FROM debian:latest

MAINTAINER awesome

RUN echo 'deb http://www.deb-multimedia.org buster main non-free' >> /etc/apt/sources.list
RUN apt-get update -y -oAcquire::AllowInsecureRepositories=true
RUN apt-get install -y --no-install-recommends --allow-unauthenticated deb-multimedia-keyring
RUN apt-get install -y --no-install-recommends --allow-unauthenticated ffmpeg
