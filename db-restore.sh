#!/bin/bash
source env-file
docker exec -i $(./db-instancename.sh) sh -c "exec mongorestore -u ${MONGO_INITDB_ROOT_USERNAME} -p ${MONGO_INITDB_ROOT_PASSWORD} --archive" < $(ls backups/*.backup | tail -1)
