#!/usr/bin/env bash

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

while true; do
  clear
  echo -e "\e[38;5;240m──────────────────────────────────────────────"
  echo -e "        HUD Hermès Ω PRIME++  v20.3 — ULTRA‑STEALTH"
  echo -e "        OpenClaw_Light — Shadow‑Ops Cockpit"
  echo -e "──────────────────────────────────────────────\e[0m"
  echo ""

  # RESSOURCES
  echo -e "\e[38;5;240m📊 RESSOURCES\e[0m"
  bash "$ROOT/hud/modules/cpu.sh"
  bash "$ROOT/hud/modules/ram.sh"
  bash "$ROOT/hud/modules/gpu.sh"
  echo ""

  # RÉSEAU
  echo -e "\e[38;5;240m🌐 RÉSEAU\e[0m"
  bash "$ROOT/hud/modules/net.sh"
  echo ""

  # RISQUES COCKPIT
  echo -e "\e[38;5;240m⚠️  RISQUES COCKPIT\e[0m"
  bash "$ROOT/hud/modules/risks.sh"
  echo ""

  # TIMELINE
  echo -e "\e[38;5;240m📜 TIMELINE\e[0m"
  bash "$ROOT/hud/modules/timeline.sh"
  echo ""

  # MODULES A1‑A22
  echo -e "\e[38;5;240m🧩 MODULES A1‑A22\e[0m"
  bash "$ROOT/hud/modules/modules_status.sh"
  echo ""

  echo -e "\e[38;5;240m──────────────────────────────────────────────"
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
