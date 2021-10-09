#! /bin/bash
# ERROR: networkmanager

set -eux

if [ $SSHD ]; then
  if [ ! -x '/usr/sbin/sshd' ]; then
    apt update -y && apt install -y openssh-server && passwd
  fi
  if [ -x '/usr/sbin/sshd' ]; then
    if [ ! -d '/run/sshd' ]; then
      mkdir /run/sshd
      sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
      sed -i 's/#X11UseLocalhost yes/X11UseLocalhost no/' /etc/ssh/sshd_config
      echo 'X11UseLocalhost no' >> /etc/ssh/sshd_config
    fi
    if [ $(ps aux | grep sshd | wc -l) -gt 0 ]; then
      /usr/sbin/sshd
    fi
  fi
fi

if [ $RDP ]; then
  if [ ! -d '/run/xrdp' ]; then
    apt update -y && apt install -y xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils xrdp network-manager network-manager-gnome
  fi
  if [ -x '/etc/init.d/xrdp' ]; then
    if [ $(ps aux | grep xrdp | wc -l) -gt 0 ]; then
      /etc/init.d/xrdp restart
    fi
  fi
fi

echo "Asia/Hong_Kong" > /etc/timezone

exec "$@"

# docker run -itd --privileged --name debian -e SSHD=Y -e RDP=Y -v ./debian_init.sh:/debian_init.sh -v /data:/data -p 30001:22 -p 30002:3389 debian:stable

# docker run -itd --privileged --name debian -e SSHD=Y -e RDP=Y -v ./debian_init.sh:/debian_init.sh -p 30001:22 -p 30002:3389 debian:stable

# docker exec -it debian /debian_init.sh
