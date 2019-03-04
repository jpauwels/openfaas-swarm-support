#!/bin/bash
read -r -a USERS <<< ${MONGO_USERS}

for ((i=0; i<"${#USERS[@]}"; i+=4));
do
    mongo --eval "db = db.getSiblingDB('${USERS[i]}'); db.createUser({user: '${USERS[i+1]}', pwd: '${USERS[i+2]}', roles: ['${USERS[i+3]}']});"
done
