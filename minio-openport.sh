#!/bin/bash
docker service update --publish-add published=9000,target=9000 --publish-add published=9001,target=9001 faas_minio
