
docker run -itd \
--name mysql-test \
-e TZ=Asia/Shanghai \
-e MYSQL_ROOT_PASSWORD=root \
-v ***/mysql:/var/lib/mysql \
-p 10001:22 \
-p 10002:3306 \
mysql:latest \
--character-set-server=utf8mb4 \
--collation-server=utf8mb4_unicode_ci 

# [mysqld]
# skip-log-bin
#
# echo 'skip-log-bin' >> /etc/mysql/conf.d/docker.cnf
#
#show variables like 'log_bin'; 
#
#purge master logs before 'yyyy-MM-dd 00:00:00';
#
#show variables like 'expire_logs_days';
#set global expire_logs_days = 30;
#show binary logs;
#
#purge binary logs to 'mysql-bin.000009';
#reset master;


