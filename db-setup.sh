#!/bin/sh
mongo --eval "
db = db.getSiblingDB('jamendo');
db.createUser({user: 'jamendo-read', pwd: '${MONGO_JAMENDO_READ_PASSWORD}', roles: ['read']});
db.createUser({user: 'jamendo-readwrite', pwd: '${MONGO_JAMENDO_READWRITE_PASSWORD}', roles: ['readWrite']});

db = db.getSiblingDB('deezer');
db.createUser({user: 'deezer-read', pwd: '${MONGO_DEEZER_READ_PASSWORD}', roles: ['read']});
db.createUser({user: 'deezer-readwrite', pwd: '${MONGO_DEEZER_READWRITE_PASSWORD}', roles: ['readWrite']});
"
