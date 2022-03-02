docker run -itd \
	--name=postgres \
	--restart=on-failure \
	-e TZ='Asia/Hong_Kong' \
	-e POSTGRES_DB=kong \
	-e POSTGRES_USER=kong \
	-e POSTGRES_PASSWORD=kong \
	--health-cmd="pg_isready -U kong" \
	--health-interval=30s \
	--health-timeout=30s \
	--health-retries=3 \
	-v ./data:/var/lib/postgresql/data \
	-p 0.0.0.0:5432:5432/tcp \
	postgres:9.5
