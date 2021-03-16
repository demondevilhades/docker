
# curl http://localhost:8001/

docker run -itd \
	--name=kong \
	--restart=on-failure \
	-e KONG_ADMIN_ACCESS_LOG=/dev/stdout \
	-e KONG_ADMIN_ERROR_LOG=/dev/stderr \
	-e KONG_PROXY_ACCESS_LOG=/dev/stdout \
	-e KONG_PROXY_ERROR_LOG=/dev/stderr \
	-e KONG_ADMIN_LISTEN='0.0.0.0:8001' \
	-e KONG_CASSANDRA_CONTACT_POINTS=${db_ip} \
	-e KONG_DATABASE=postgres \
	-e KONG_PG_DATABASE:=kong \
	-e KONG_PG_HOST=${db_ip} \
	-e KONG_PG_USER=kong \
	-e KONG_PG_PASSWORD=kong \
	-v ./log:/data/log:rw \
	--health-cmd="kong health" \
	--health-interval=10s \
	--health-timeout=10s \
	--health-retries=10 \
	-p 0.0.0.0:8000:8000/tcp \
	-p 0.0.0.0:8001:8001/tcp \
	-p 0.0.0.0:8443:8443/tcp \
	-p 0.0.0.0:8444:8444/tcp \
	kong

&& {
docker run --rm \
	--name=kong-migrations \
	-e KONG_DATABASE=postgres \
	-e KONG_PG_DATABASE=kong \
	-e KONG_PG_HOST=${db_ip} \
	-e KONG_PG_USER=kong \
	-e KONG_PG_PASSWORD=kong \
	kong kong migrations bootstrap

docker run --rm \
	--name=kong-migrations \
	-e KONG_DATABASE=postgres \
	-e KONG_PG_DATABASE=kong \
	-e KONG_PG_HOST=${db_ip} \
	-e KONG_PG_USER=kong \
	-e KONG_PG_PASSWORD=kong \
	kong kong migrations up && kong migrations finish

}
