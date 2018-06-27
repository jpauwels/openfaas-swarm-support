#!/bin/bash
source env-file
docker run --rm -it --network=func_functions ubuntu:18.04 sh -c "apt-get update -y && apt-get install -y ipython3 python3-pip inetutils-ping mongodb && pip3 install pymongo && mongo 'mongodb://${MONGO_INITDB_ROOT_USERNAME}:${MONGO_INITDB_ROOT_PASSWORD}@faas-mongodb:27017/admin' && sh"