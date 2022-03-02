
######### 9.5

#### master

echo -e "host\treplication\tkong\t${slave_ip}/32\ttrust" >> pg_hba.conf

sed -i "248i hot_standby = on" postgresql.conf
sed -i "240i synchronous_standby_names = '*'" postgresql.conf
sed -i "227i wal_sender_timeout = 60s" postgresql.conf
sed -i "226i wal_keep_segments = 64" postgresql.conf
sed -i "225i max_wal_senders = 32" postgresql.conf
sed -i "177i synchronous_commit = local" postgresql.conf
sed -i "174i wal_level = hot_standby" postgresql.conf

docker restart postgres

# create replica user
#docker exec -it postgres psql -U kong -p 5432
#set synchronous_commit =off;
#create role replica login replication encrypted password 'replica';
#\du
#\q

# validate
docker exec postgres psql -U kong -x -c "select * from pg_roles;"


### slave

# clean data
docker exec postgres rm -rf /var/lib/postgresql/data/

# backup
docker exec postgres pg_basebackup -h ${master_ip} -p 5432 -U kong -F p -x -P -R -D /var/lib/postgresql/data/ -l postgresbackup_init

# validate master
docker exec postgres psql -U kong -x -c "select * from pg_stat_replication;"

docker exec postgres psql -U kong -x -c "select pg_is_in_recovery();"

docker exec postgres psql -U kong -x -c "\d"
