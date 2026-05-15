#!/usr/bin/env bash
set -euo pipefail

cd /app

uv run --directory apps/api uvicorn micracode_api.main:app --host 0.0.0.0 --port 8000 &
api_pid=$!

bun --cwd apps/web run start -- --hostname 0.0.0.0 --port 3000 &
web_pid=$!

cleanup() {
  kill -TERM "$api_pid" "$web_pid" 2>/dev/null || true
  wait "$api_pid" "$web_pid" 2>/dev/null || true
}

trap cleanup SIGINT SIGTERM

wait -n "$api_pid" "$web_pid"
exit_code=$?
cleanup
exit "$exit_code"
