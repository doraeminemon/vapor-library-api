build:
	docker build -t library-api-release -f prod.dockerfile .
backup:
	docker exec library-api-db /bin/bash \
  	-c "export PGPASSWORD=postgres \
		&& /usr/local/bin/pg_dump -U postgres library_api" \
		> backup.sql