#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR="./backups"
mkdir -p "$BACKUP_DIR"

FILENAME="$BACKUP_DIR/postgres_dump_$(date +%Y%m%d_%H%M%S).sql"

echo ">>> Backing up database ${POSTGRES_DB}..."
docker exec -t ${POSTGRES_CONTAINER_NAME} \
  pg_dump -U ${POSTGRES_USER} ${POSTGRES_DB} > "$FILENAME"

echo ">>> Backup saved to $FILENAME"
