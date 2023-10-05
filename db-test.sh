#!/bin/bash
MONGO_INITDB_ROOT_USERNAME=$(cat secrets/mongodb_root_username.txt)
MONGO_INITDB_ROOT_PASSWORD=$(cat secrets/mongodb_root_password.txt)
docker run --rm -it --network=func_functions ubuntu:22.04 sh -c "apt-get update -y && apt-get install -y ipython3 python3-pip inetutils-ping mongodb && pip3 install pymongo && mongo 'mongodb://${MONGO_INITDB_ROOT_USERNAME}:${MONGO_INITDB_ROOT_PASSWORD}@faas_mongodb:27017/admin' && sh"
