docker run -itd \
--name aria2-web \
--privileged=true \
-e TZ=Asia/Shanghai \
-p 6801:80 \
-p 6800:6800 \
-v /Users/awesome/workspace/docker/aria2/download:/data/download \
aria2-web:base /bin/bash

