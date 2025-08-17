#!/usr/bin/env bash
set -euo pipefail

if [ -z "${1:-}" ]; then
  echo "Usage: $0 <backup_file.sql>"
  exit 1
fi

BACKUP_FILE=$1

echo ">>> Restoring database ${POSTGRES_DB} from $BACKUP_FILE..."
cat "$BACKUP_FILE" | docker exec -i ${POSTGRES_CONTAINER_NAME} \
  psql -U ${POSTGRES_USER} -d ${POSTGRES_DB}

echo ">>> Restore complete!"
