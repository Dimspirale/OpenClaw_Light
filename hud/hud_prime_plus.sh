#!/usr/bin/env bash

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

while true; do
  clear
  echo -e "\e[38;5;245m──────────────────────────────────────────────"
  echo -e "        HUD Hermès Ω PRIME+  v20.2 — STEALTH"
  echo -e "        OpenClaw_Light — Cockpit"
  echo -e "──────────────────────────────────────────────\e[0m"
  echo ""

  echo -e "\e[38;5;245m📊 RESSOURCES (STEALTH)\e[0m"
  bash "$ROOT/hud/modules/cpu.sh"
  bash "$ROOT/hud/modules/ram.sh"
  echo ""

  echo -e "\e[38;5;245m🌐 RÉSEAU\e[0m"
  bash "$ROOT/hud/modules/net.sh"
  echo ""

  echo -e "\e[38;5;245m📜 TIMELINE\e[0m"
  bash "$ROOT/hud/modules/timeline.sh"
  echo ""

  echo -e "\e[38;5;245m🧩 MODULES A1‑A22\e[0m"
  bash "$ROOT/hud/modules/modules_status.sh"
  echo ""

  echo -e "\e[38;5;245m──────────────────────────────────────────────"
  echo -e "Raccourcis :"
  echo -e "  [S] save.sh"
  echo -e "  [R] rollback.sh"
  echo -e "  [Q] quitter"
  echo -e "──────────────────────────────────────────────\e[0m"
  echo -n "Choix : "
  read -r choice

  case "$choice" in
    s|S) bash "$ROOT/save.sh" ;;
    r|R) bash "$ROOT/rollback.sh" ;;
    q|Q) clear; exit 0 ;;
  esac
done
