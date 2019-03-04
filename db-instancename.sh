#!/bin/bash
# docker ps --filter "name=faas-mongodb.1.*" --format "{{.Names}}"
echo faas_mongodb.1.$(docker service ps --filter "name=faas_mongodb.1" -q --no-trunc faas_mongodb | head -n1)
