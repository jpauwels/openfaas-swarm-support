#!/bin/bash
docker exec $(./db-instancename.sh) sh -c 'exec mongorestore --archive' < $(ls backups/*.backup | tail -1)
