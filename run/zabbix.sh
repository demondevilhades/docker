
# 1. mysql
docker run --name mysql-server -itd \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/timezone:/etc/timezone:ro \
-e MYSQL_DATABASE="zabbix" \
-e MYSQL_USER="zabbix" \
-e MYSQL_PASSWORD="zabbix" \
-e MYSQL_ROOT_PASSWORD="root" \
mysql:8.0.16

# 2. server
docker run --name zabbix-server-mysql -itd \
--link mysql-server:mysql \
--link zabbix-java-gateway:zabbix-java-gateway \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/timezone:/etc/timezone:ro \
-e DB_SERVER_HOST="mysql-server" \
-e MYSQL_DATABASE="zabbix" \
-e MYSQL_USER="zabbix" \
-e MYSQL_PASSWORD="zabbix" \
-e MYSQL_ROOT_PASSWORD="root" \
-e ZBX_JAVAGATEWAY="zabbix-java-gateway" \
-p 10051:10051 \
zabbix/zabbix-server-mysql:latest

# 3. web
docker run --name zabbix-web-nginx-mysql -itd \
--link mysql-server:mysql \
--link zabbix-server-mysql:zabbix-server \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/timezone:/etc/timezone:ro \
-e DB_SERVER_HOST="mysql-server" \
-e MYSQL_DATABASE="zabbix" \
-e MYSQL_USER="zabbix" \
-e MYSQL_PASSWORD="zabbix" \
-e MYSQL_ROOT_PASSWORD="root" \
-p 80:80 \
-d zabbix/zabbix-web-nginx-mysql:latest

# 4. agent
docker run --name zabbix-agent -itd \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/timezone:/etc/timezone:ro \
-e ZBX_HOSTNAME="test_agent" \
-e ZBX_SERVER_HOST="*.*.*.*,*.*.*.0/24" \
-e ZBX_SERVER_PORT=10050 \
-e ZBX_ACTIVE_ALLOW="true" \
-e ZBX_PASSIVE_ALLOW="false" \
-e ZBX_METADATA="harbor" \
-p 10050:10050 \
--privileged \
zabbix/zabbix-agent:latest






