#!/bin/bash
source env-mongodb
docker exec $(./db-instancename.sh) sh -c "exec mongoexport -u ${MONGO_INITDB_ROOT_USERNAME} -p ${MONGO_INITDB_ROOT_PASSWORD} --authenticationDatabase admin --jsonArray --db ac_analysis_service --collection descriptors" > exports/descriptors-$(date -Iseconds).json
