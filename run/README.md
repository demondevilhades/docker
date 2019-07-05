
# datetime sync

-v /etc/localtime:/etc/localtime:ro
-v /etc/timezone:/etc/timezone:ro

# Alpine
#! /bin/bash
set -eux
apk add tzdata
cp /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime
echo "Asia/Hong_Kong" > /etc/timezone

# Debian
#! /bin/bash
set -eux
echo "export TZ='Asia/Hong_Kong'"  >> /etc/profile 
source /etc/profile
