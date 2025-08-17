#!/usr/bin/env bash
set -euo pipefail

echo ">>> Stopping containers..."
docker compose down -v

echo ">>> Rebuilding containers..."
docker compose up -d --build

echo ">>> PostgreSQL reset complete!"
