#!/bin/bash
MONGO_INITDB_ROOT_USERNAME=$(cat secrets/mongodb_root_username.txt)
MONGO_INITDB_ROOT_PASSWORD=$(cat secrets/mongodb_root_password.txt)
docker exec $(./db-instancename.sh) sh -c "exec mongodump -u ${MONGO_INITDB_ROOT_USERNAME} -p ${MONGO_INITDB_ROOT_PASSWORD} --authenticationDatabase admin --archive" > backups/$(date -Iseconds).backup
