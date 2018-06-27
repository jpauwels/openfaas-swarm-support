#!/bin/bash
docker exec $(./db-instancename.sh) sh -c 'exec mongodump --archive' > backups/$(date -Iseconds).backup
