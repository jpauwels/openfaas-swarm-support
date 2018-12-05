#!/bin/bash
docker service update --publish-rm published=27017,target=27017 faas_mongodb
