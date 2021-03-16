docker run -itd \
	--name=konga \
	--restart=on-failure \
	-e DB_ADAPTER=postgres \
	-e DB_DATABASE=kong \
	-e DB_HOST=${db_ip} \
	-e DB_PORT=5432 \
	-e DB_USER=kong \
	-e DB_PASSWORD=kong \
	-p 0.0.0.0:1337:1337/tcp \
	pantsel/konga
