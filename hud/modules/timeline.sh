#!/usr/bin/env bash

LOG="$HOME/OpenClaw_Light/cron.log"

echo "Timeline :"
if [ -f "$LOG" ]; then
  tail -n 5 "$LOG" | sed 's/^/   • /'
else
  echo "   • (vide)"
fi
