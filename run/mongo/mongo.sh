
export MONGO_DATA=

docker run -itd \
--name mongo-dev \
-v $MONGO_DATA:/data/db \
-p 27017:27017 \
-e MONGO_INITDB_ROOT_USERNAME=root \
-e MONGO_INITDB_ROOT_PASSWORD=root \
mongo:4.2.0

docker run -itd \
--name mongo-express-dev \
-p 8081:8081 \
--link mongo-dev:mongo \
-e ME_CONFIG_MONGODB_SERVER=some-mongo \
-e ME_CONFIG_BASICAUTH_USERNAME=admin \
-e ME_CONFIG_BASICAUTH_PASSWORD=admin \
-e ME_CONFIG_MONGODB_ADMINUSERNAME=root \
-e ME_CONFIG_MONGODB_ADMINPASSWORD=root \
-e ME_CONFIG_MONGODB_SERVER=mongo \
-e ME_CONFIG_MONGODB_PORT=27017 \
mongo-express


