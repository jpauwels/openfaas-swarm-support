#!/bin/bash

function kong_admin_curl {
    docker exec $(docker ps -q -f name="kong\.") curl $@
}
kong_admin_curl -X POST http://localhost:8001/services/ --data 'name=openfaas' --data 'url=http://gateway:8080' --data 'retries=1' --data 'read_timeout=2700000'
kong_admin_curl -X POST http://localhost:8001/services/openfaas/routes --data 'name=openfaas-functions' --data 'paths[]=/function&paths[]=/async-function' --data 'strip_path=false'

kong_admin_curl -X POST http://localhost:8001/services/ --data 'name=qbc' --data 'url=http://qbc_api:80'
kong_admin_curl -X POST http://localhost:8001/services/qbc/routes --data 'name=qbc' --data 'paths[]=/qbc' --data 'strip_path=false'

kong_admin_curl -X POST http://localhost:8001/services/openfaas/plugins --data "name=cors" --data "config.origins=*" --data "config.methods=GET" --data "config.methods=POST" --data "config.headers=Accept" --data "config.headers=Accept-Version" --data "config.headers=Content-Length" --data "config.headers=Content-MD5" --data "config.headers=Content-Type" --data "config.headers=Date" --data "config.headers=X-Auth-Token" --data "config.exposed_headers=X-Auth-Token" --data "config.credentials=true" --data "config.max_age=3600"

# Setup Letsencrypt HTTPS
# kong_admin_curl -X POST http://localhost:8001/certificates -d "cert=$(cat /etc/letsencrypt/live/audio-analysis.eecs.qmul.ac.uk/fullchain.pem)" -d "key=$(cat /etc/letsencrypt/live/audio-analysis.eecs.qmul.ac.uk/privkey.pem)" -d "snis[]=audio-analysis.eecs.qmul.ac.uk"
# kong_admin_curl -i -X POST http://localhost:8001/apis -d "name=ssl-api" -d "upstream_url=http://gateway:8080" -d "hosts=audio-analysis.eecs.qmul.ac.uk"
# Config https_only as --data arg here --^

### Check certificate
#kong_admin_curl http://localhost:8001/certificates/audio-analysis.eecs.qmul.ac.uk
