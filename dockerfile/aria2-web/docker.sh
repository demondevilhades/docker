#! /bin/bash

set -eux
/usr/sbin/nginx
/usr/bin/aria2c --conf-path=/data/aria2.conf -D

