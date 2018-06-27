#!/bin/bash
docker service create --network=func_functions --name faas-mongodb --env-file=env-file --mount type=volume,source=mongodb-dbdata,destination=/data/db --mount type=volume,source=mongodb-configdata,destination=/data/configdb --mount type=bind,source=${PWD}/db-setup.sh,destination=/docker-entrypoint-initdb.d/db-setup.sh mongo:3.6-jessie
