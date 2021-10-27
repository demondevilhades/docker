docker run -itd \
-p 80:80 \
-v ***:/usr/local/apache2/htdocs \
--restart=always \
--name httpd \
httpd:latest
