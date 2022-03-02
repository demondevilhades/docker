
docker volume create mongo_data

docker run -itd --name mongo-dev -v mongo_data:/data/db -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=root mongo:4.2.0

docker run -itd --name mongo-express-dev -p 8081:8081 --link mongo-dev:mongo -e ME_CONFIG_MONGODB_SERVER=some-mongo -e ME_CONFIG_BASICAUTH_USERNAME=admin -e ME_CONFIG_BASICAUTH_PASSWORD=admin -e ME_CONFIG_MONGODB_ADMINUSERNAME=root -e ME_CONFIG_MONGODB_ADMINPASSWORD=root -e ME_CONFIG_MONGODB_SERVER=mongo -e ME_CONFIG_MONGODB_PORT=27017 mongo-express

rem http://localhost:8081/
docker exec -it mongo-dev bash
mongo localhost:27017/admin -u root -p root

use app_db
db.createUser( {user: "app", pwd: "app", roles: [ { role: "readWrite", db: "app_db" } ]  } )
