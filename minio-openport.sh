#!/bin/bash
docker service update --publish-add published=9000,target=9000 faas_minio
