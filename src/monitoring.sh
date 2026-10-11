#!/usr/bin/env bash
set -euo pipefail 
INTERVAL="${1:-10}"
URL="${2:-http://127.0.0.1:5000/health}" 
echo "Memantau setiap $INTERVAL detik. Tekan Ctrl+C untuk berhenti."
while true; do
  if curl -fsS --max-time 5 "$URL" >/dev/null 2>&1; then
    echo "$(date '+%F %T') UP"
  else
    echo "$(date '+%F %T') DOWN"
  fi
  sleep "$INTERVAL"
done
