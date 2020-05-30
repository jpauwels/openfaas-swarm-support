#!/bin/bash
source env-mongodb
docker exec $(./db-instancename.sh) sh -c "exec mongodump -u ${MONGO_INITDB_ROOT_USERNAME} -p ${MONGO_INITDB_ROOT_PASSWORD} --authenticationDatabase admin --archive" > backups/$(date -Iseconds).backup
