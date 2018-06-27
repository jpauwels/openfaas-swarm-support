#!/bin/bash
docker service update --publish-add published=27017,target=27017 faas-mongodb
