FROM debian

MAINTAINER awesome <demonhades@foxmail.com>

ENV aria2_version=1.1.3

RUN set -eux \
	&& mkdir /data \
	&& mkdir /data/download \
	&& mkdir /data/AriaNg

ADD sources-ustc.list /etc/apt/
ADD aria2.conf docker.sh /data/
ADD AriaNg-server.conf /etc/nginx/conf.d/

RUN set -eux \
	&& mv /etc/apt/sources.list /etc/apt/sources.list.bak \
	&& cp /etc/apt/sources-ustc.list /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends vim wget curl net-tools procps unzip aria2 nginx \
	&& rm -rf /var/lib/apt/lists/* \
	&& touch /data/aria2.session \
	&& wget -N --no-check-certificate -O /data/AriaNg-${aria2_version}.zip https://github.com/mayswind/AriaNg/releases/download/${aria2_version}/AriaNg-${aria2_version}.zip \
	&& unzip /data/AriaNg-${aria2_version}.zip -d /data/AriaNg \
	&& rm -f /data/AriaNg-${aria2_version}.zip \
	&& chmod 755 -R /data

VOLUME /data/download
EXPOSE 80 6800
CMD ["/data/docker.sh"]

