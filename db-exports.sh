#!/bin/bash
MONGO_INITDB_ROOT_USERNAME=$(cat secrets/mongodb_root_username.txt)
MONGO_INITDB_ROOT_PASSWORD=$(cat secrets/mongodb_root_password.txt)
docker run --rm --network=func_functions mongo:6-jammy sh -c "exec mongoexport --host faas_mongodb:27017 -u ${MONGO_INITDB_ROOT_USERNAME} -p ${MONGO_INITDB_ROOT_PASSWORD} --authenticationDatabase admin --db audiocommons --collection descriptors" > exports/audiocommons-descriptors-$(date -Iseconds).json
#docker exec $(./db-instancename.sh) sh -c "exec mongoexport -u ${MONGO_INITDB_ROOT_USERNAME} -p ${MONGO_INITDB_ROOT_PASSWORD} --authenticationDatabase admin --db audiocommons --collection descriptors" > exports/audiocommons-descriptors-$(date -Iseconds).json
